//
//  ContentView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeatherView(viewModel: WeatherViewModel())
    }
}

#Preview {
    ContentView()
}
