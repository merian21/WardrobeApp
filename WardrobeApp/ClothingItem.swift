//
//  ClothingItem.swift
//  WardrobeApp
//
//  Created by Paul Becker on 05.06.24.
//

import Foundation
import SwiftUI

// Model for individual Clothing Items
struct ClothingItem: Identifiable {
    let id = UUID()
    let photo: Image
    let brandName: String
    let color: String
    let type: ClothingType
    
    // Sample item for previews
    static var sampleItem: ClothingItem {
        return ClothingItem(photo: Image("sweaterImage"), brandName: "SampleBrand", color: "Black", type: ClothingType.sweater)
    }
}

enum ClothingType: String, CaseIterable {
    case sweater = "Sweater"
    case pants = "Pants"
    case shorts = "Shorts"
    case tShirt = "T-Shirt"
    case shirt = "Shirt"
}
