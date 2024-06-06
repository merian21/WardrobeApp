//
//  ClothingColorPickerView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 06.06.24.
//

import SwiftUI

struct ClothingColorPickerView: View {
    @Binding var selectedColor: ClothingColor
    
    var body: some View {
        List {
            ForEach(ClothingColor.allCases) { color in
                HStack {
                    Text(color.rawValue)
                    Spacer()
                    RoundedRectangle(cornerRadius: 5)
                        .fill(color.color)
                        .frame(width: 20, height: 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                            )
                }
                .onTapGesture {
                    selectedColor = color
                    // Dismiss the view, if needed
                }
            }
        }
        .navigationBarTitle("Select Color", displayMode: .inline)
    }
}

#Preview {
    ClothingColorPickerView(selectedColor: .constant(.red))
}
