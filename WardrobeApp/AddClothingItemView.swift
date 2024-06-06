//
//  AddClothingItemView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI

struct AddClothingItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: UIImage?
    @State private var brandName: String = ""
    @State private var color: ClothingColor = .red
    @State private var clothingType: ClothingType = .tShirt
    @ObservedObject var viewModel: ClothingViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Photo")) {
                    Button(action: {
                        // Add functionality to select a photo
                    }) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: 200)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: 200)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Section(header: Text("Details")) {
                    TextField("Brand Name", text: $brandName)
                    Picker("Color", selection: $color) {
                        ForEach(ClothingColor.allCases) { color in
                            HStack {
                                Text(color.rawValue)
                                Spacer()
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(color.color)
                                    .frame(width: 20, height: 20)
                            }
                            .tag(color)
                        }
                    }
                    Picker("Type", selection: $clothingType) {
                        ForEach(ClothingType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
            }
            .navigationBarTitle("Add Clothing Item", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                if let selectedImage = selectedImage {
                    let newItem = ClothingItem(photo: Image(uiImage: selectedImage), brandName: brandName, color: color, type: clothingType)
                    viewModel.addClothingItem(photo: Image(uiImage: selectedImage), brandName: brandName, color: color, type: clothingType)
                }
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    AddClothingItemView()
}
