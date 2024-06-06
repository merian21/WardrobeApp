//
//  ClothingItemView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct ClothingItemView: View {
    let item: ClothingItem

    var body: some View {
        VStack(spacing: 0) {
            item.photo
                .resizable().scaledToFill()
                .frame(width: 170, height: 170)
                .clipped()

            VStack(spacing: 0) {
                HStack {
                    Text(item.brandName)
                        .frame(width: .infinity, alignment: .leading)
                        .font(.title2)
                        .fontWeight(.semibold)
                    .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                HStack {
                    Text(item.type.rawValue + " • " + item.color.rawValue)
                        .font(.system(size: 16))
                    .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
            }
            .frame(width: 170, height: 60)
            .background(Color(UIColor.systemBackground))


        }
        .frame(width: 170, height: 230)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)

        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundColor(Color.black.opacity(0.1))
        )
    }
}

#Preview {
    ClothingItemView(item: ClothingItem.sampleItem)
}
