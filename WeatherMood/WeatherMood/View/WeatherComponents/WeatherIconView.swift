//
//  WeatherIconView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import SwiftUI

struct WeatherIconView: View {
    let iconURL: String
    let width: CGFloat
    let height: CGFloat
    let imageData: Data
    
    var body: some View {
        AsyncImage(url: URL(string: iconURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
            case .failure(_):
                if let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: width, height: height)
                                .foregroundColor(.gray)
                }
            @unknown default:
                if let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: width, height: height)
                                .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    WeatherIconView(iconURL: "", width: 83, height: 67, imageData: Data())
}
