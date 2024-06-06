//
//  WardrobeView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct WardrobeView: View {
    // Observing the ViewModel
    @ObservedObject var viewModel: ClothingViewModel
    
    // Defining the layout of the grid
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Displaying clothing items in a grid
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.clothingItems) { item in
                        ClothingItemView(item: item)
                    }
                }
                .padding()
            }
            .navigationTitle("My Wardrobe")
        }
    }
}

#Preview {
    WardrobeView(viewModel: ClothingViewModel())
}
