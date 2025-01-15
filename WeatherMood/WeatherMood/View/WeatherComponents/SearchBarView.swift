//
//  SearchBarView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField(Constants.Strings.searchFieldPlaceholder, text: $searchText)
                .padding(.leading, 20)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing, 20)
        }
        .frame(height: 46)
        .background(Color(hex: "#F2F2F2"))
        .cornerRadius(16)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}

#Preview {
    @Previewable @State var searchText = ""
    SearchBarView(searchText: $searchText)
}
