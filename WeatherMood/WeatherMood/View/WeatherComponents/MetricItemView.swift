//
//  MetricItemView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct MetricItemView: View {
    let title: String
    let value: String
    let titleSize: CGFloat
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(CustomFont.poppinsMedium.font(size: titleSize, weight: .medium))
                .foregroundColor(._C4C4C4)
            
            Text(value)
                .font(CustomFont.poppinsMedium.font(size: 15, weight: .medium))
                .foregroundColor(._9A9A9A)
        }
    }
}

#Preview {
    MetricItemView(title: "Humidity", value: "30%", titleSize: 12)
}
