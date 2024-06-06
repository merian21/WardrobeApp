//
//  ClodingViewModel.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import Foundation
import SwiftUI

class ClothingViewModel: ObservableObject {
    // An array of clothing items, marked as @Published so views will update when this array changes
    @Published var clothingItems: [ClothingItem] = []
    
    // Initializer to set up sample data
    init() {
        clothingItems = [
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            ClothingItem(photo: Image("sweaterImage"), brandName: "Brand A", color: .black, type: ClothingType.sweater),
            // Add more sample items here
        ]
    }
    
    // Method to add a new clothing item to the array
    func addClothingItem(photo: Image, brandName: String, color: ClothingColor, clothingType: ClothingType) {
        let newItem = ClothingItem(photo: photo, brandName: brandName, color: color, type: clothingType)
        clothingItems.append(newItem)
    }
    
    // Method to add a new clothing item to the array
    func addClothingItem(item: ClothingItem) {
        clothingItems.append(item)
    }
}
