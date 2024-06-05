//
//  ContentView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WardrobeView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Wardrobe")
                }
            
            OutfitSuggestionView()
                .tabItem {
                    Image(systemName: "lightbulb.fill")
                    Text("Suggestions")
                }
        }
    }
}

#Preview {
    ContentView()
}
