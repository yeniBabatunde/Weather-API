//
//  WeatherMoodApp.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI
import IQKeyboardManagerSwift

@main
struct WeatherMoodApp: App {
    
    init() {
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
