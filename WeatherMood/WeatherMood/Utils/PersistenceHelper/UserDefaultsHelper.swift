//
//  UserDefaultsHelper.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

protocol UserDefaultsHelperProtocol {
    func save<T: Encodable>(_ object: T, for key: String)
    func retrieve<T: Decodable>(_ type: T.Type, for key: String) -> T?
    func remove(for key: String)
}

class UserDefaultsHelper: UserDefaultsHelperProtocol {
    private let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    private func getDocumentsDirectory() -> URL {
        fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func getFileURL(for key: String) -> URL {
        getDocumentsDirectory().appendingPathComponent("\(key).json")
    }
    
    func save<T: Encodable>(_ object: T, for key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            let fileURL = getFileURL(for: key)
            try fileManager.createDirectory(
                at: fileURL.deletingLastPathComponent(),
                withIntermediateDirectories: true
            )
            
            try data.write(to: fileURL, options: .atomic)
        } catch {
            Logger.printIfDebug(data: "Error saving to FileManager: \(error)", logType: .error)
        }
    }
    
    func retrieve<T: Decodable>(_ type: T.Type, for key: String) -> T? {
        let fileURL = getFileURL(for: key)
        
        do {
            guard fileManager.fileExists(atPath: fileURL.path) else { return nil }
            let data = try Data(contentsOf: fileURL)
            let object = try JSONDecoder().decode(type, from: data)
            return object
        } catch {
            Logger.printIfDebug(data: "Error retrieving from FileManager: \(error)", logType: .error)
            return nil
        }
    }
    
    func remove(for key: String) {
        let fileURL = getFileURL(for: key)
        do {
            if fileManager.fileExists(atPath: fileURL.path) {
                try fileManager.removeItem(at: fileURL)
            }
        } catch {
            Logger.printIfDebug(data: "Error removing file: \(error)", logType: .error)
        }
    }
   
    func clearAll() {
        let documentsURL = getDocumentsDirectory()
        do {
            let fileURLs = try fileManager.contentsOfDirectory(
                at: documentsURL,
                includingPropertiesForKeys: nil
            )
            for fileURL in fileURLs where fileURL.pathExtension == "json" {
                try fileManager.removeItem(at: fileURL)
            }
        } catch {
            Logger.printIfDebug(data: "Error clearing all files: \(error)", logType: .error)
        }
    }
    
    func fileExists(for key: String) -> Bool {
        let fileURL = getFileURL(for: key)
        return fileManager.fileExists(atPath: fileURL.path)
    }
}
