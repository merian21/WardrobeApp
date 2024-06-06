//
//  AddClothingItemButton.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct AddClothingItemButton: View {
    @State private var showAddClothingItemView = false
    @ObservedObject var viewModel: ClothingViewModel
    
    var body: some View {
        Button {
            showAddClothingItemView.toggle()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
        }
        .frame(width: 80, height: 45)
        .background(Color.black)
        .cornerRadius(20)
        .foregroundColor(Color(UIColor.systemBackground))
        .shadow(color: Color.black.opacity(0.2) ,radius: 1, x: 2, y: 2)
        .sheet(isPresented: $showAddClothingItemView) {
            AddClothingItemView(viewModel: viewModel)
        }

    }
}

#Preview {
    AddClothingItemButton(viewModel: ClothingViewModel())
}
