//
//  AddClothingItemView.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import SwiftUI
import PhotosUI

struct AddClothingItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: UIImage?
    @State private var brandName: String = ""
    @State private var color: ClothingColor = .red
    @State private var clothingType: ClothingType = .tShirt
    @ObservedObject var viewModel: ClothingViewModel

    @State private var isColorPickerPresented = false
    @State private var isTypePickerPresented = false
    @State private var selectedItem: PhotosPickerItem? = nil

    var body: some View {
        NavigationStack {
        VStack(spacing: 0) {

            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 350)
                            .cornerRadius(20)
                    } else {
                        Image("sweaterImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 350)
                            .cornerRadius(20)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImage = uiImage
                        }
                    }
                }
                
                Form() {
                    Section() {
                        TextField("Brand", text: $brandName)
                    }
                    .frame(height: 40)
                    
                    
                    Section {
                        HStack {
                            Text("Color")
                            Spacer()
                            Text(color.rawValue)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black.opacity(0.3))
                        }
                        .frame(height: 40)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isColorPickerPresented.toggle()
                        }
                        
                        HStack {
                            Text("Category")
                            Spacer()
                            Text(clothingType.rawValue)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black.opacity(0.3))
                        }
                        .frame(height: 40)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isTypePickerPresented.toggle()
                        }
                    }
                }
                .formStyle(GroupedFormStyle())
                
                Button(action: {
                    if let selectedImage = selectedImage {
                        let newItem = ClothingItem(photo: Image(uiImage: selectedImage), brandName: brandName, color: color, type: clothingType)
                        viewModel.addClothingItem(item: newItem)
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    
                    HStack {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        Text(" Add Item")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .frame(width: 350, height: 60)
                    .background(Color.black)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 1, x: 4, y: 4)
                }
                .padding()
            }
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .navigationDestination(isPresented: $isColorPickerPresented) {
                ClothingColorPickerView(selectedColor: $color)
            }
            .navigationDestination(isPresented: $isTypePickerPresented) {
                ClothingTypePickerView(selectedType: $clothingType)
            }
        }
    }
}

#Preview {
    AddClothingItemView(viewModel: ClothingViewModel())
}
