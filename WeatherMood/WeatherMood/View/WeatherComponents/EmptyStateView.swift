//
//  EmptyStateView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(Constants.Strings.noCitySelected)
                .font(CustomFont.poppinsBold.font(size: 30, weight: .semibold))
                .foregroundColor(._2C2C2C)
            
            Text(Constants.Strings.searchForCity)
                .font(CustomFont.poppinsBold.font(size: 15, weight: .semibold))
                .foregroundColor(._2C2C2C)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    EmptyStateView()
}
