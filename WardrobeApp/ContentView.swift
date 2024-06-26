//
//  ContentView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClothingViewModel()

    var body: some View {
        ZStack {
            TabView {
                
                WardrobeView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "square.grid.2x2.fill")
                        Text("Wardrobe")
                    }
                
                Text("")
                    .tabItem {
                        Image(systemName: "plus")
                    }
                    .disabled(true)
                
                OutfitSuggestionView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Outfits")
                    }
                
            }
            VStack {
                Spacer()
                AddClothingItemButton(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
