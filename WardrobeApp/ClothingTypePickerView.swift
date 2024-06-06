//
//  ClothingTypePickerView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 06.06.24.
//

import SwiftUI

struct ClothingTypePickerView: View {
    @Binding var selectedType: ClothingType
    
    var body: some View {
        List {
            ForEach(ClothingType.allCases, id: \.self) { type in
                Text(type.rawValue)
                    .onTapGesture {
                        selectedType = type
                        // Dismiss the view, if needed
                    }
            }
        }
        .navigationBarTitle("Select Category", displayMode: .inline)
    }
}

#Preview {
    ClothingTypePickerView(selectedType: .constant(.tShirt))
}
