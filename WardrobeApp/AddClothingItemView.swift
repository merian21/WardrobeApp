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
            ScrollView {
                VStack(spacing: 16) {
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 350, height: 350)
                                .cornerRadius(20)
                        } else {
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.black.opacity(0.3))
                                    .frame(width: 50, height: 50)
                                Text("Please select a photo")
                                    .foregroundColor(.black.opacity(0.3))
                            }
                            .frame(width: 350, height: 350)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color.black.opacity(0.1))
                    )
                    .buttonStyle(PlainButtonStyle())
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                            }
                        }
                    }

                    VStack(spacing: 22) {
                        HStack {
                            TextField("Brand", text: $brandName)
                                .frame(width: 320)
                                .font(.headline)
                        }
                        .frame(width: 320, height: 40)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                                .foregroundColor(Color.black.opacity(0.1))
                        )

                        HStack {
                            Text("Color")
                            Spacer()
                            Text(color.rawValue)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black.opacity(0.3))
                        }
                        
                        .frame(width: 320, height: 40)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                                .foregroundColor(Color.black.opacity(0.1))
                        )
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
                        .frame(width: 320, height: 40)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                                .foregroundColor(Color.black.opacity(0.1))
                        )
                        .onTapGesture {
                            isTypePickerPresented.toggle()
                        }
                    }
                    .padding()

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
                .padding(.top, 20)
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
