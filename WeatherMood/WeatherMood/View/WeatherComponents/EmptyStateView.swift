//
//  EmptyStateView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct EmptyStateView: View {
    
    var titleText: String
    var subtitleText: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .font(CustomFont.poppinsBold.font(size: 30, weight: .semibold))
                .foregroundColor(._2C2C2C)
            
            Text(subtitleText)
                .font(CustomFont.poppinsBold.font(size: 15, weight: .semibold))
                .foregroundColor(._2C2C2C)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    EmptyStateView(titleText: Constants.Strings.noCitySelected, subtitleText: Constants.Strings.searchForCity)
}
