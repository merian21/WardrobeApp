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
                    Image(systemName: "rectangle.grid.2x2.fill")
                    Text("Wardrobe")
                }
        }
    }
}

#Preview {
    ContentView()
}
