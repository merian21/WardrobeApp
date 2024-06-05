//
//  AddClothingItemButton.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct AddClothingItemButton: View {
    var body: some View {
        Button {
            //TODO
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

    }
}

#Preview {
    AddClothingItemButton()
}
