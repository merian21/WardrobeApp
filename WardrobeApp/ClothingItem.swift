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
    let color: ClothingColor
    let type: ClothingType
    
    // Sample item for previews
    static var sampleItem: ClothingItem {
        return ClothingItem(photo: Image("sweaterImage"), brandName: "SampleBrand", color: .black, type: ClothingType.sweater)
    }
}

enum ClothingType: String, CaseIterable {
    case sweater = "Sweater"
    case pants = "Pants"
    case shorts = "Shorts"
    case tShirt = "T-Shirt"
    case shirt = "Shirt"
}

enum ClothingColor: String, CaseIterable, Identifiable {
    case red = "Red"
    case blue = "Blue"
    case green = "Green"
    case black = "Black"
    case white = "White"
    
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .red:
            return Color(red: 1.0, green: 0.0, blue: 0.0)
        case .blue:
            return Color(red: 0.0, green: 0.0, blue: 1.0)
        case .green:
            return Color(red: 0.0, green: 1.0, blue: 0.0)
        case .black:
            return Color(red: 0.0, green: 0.0, blue: 0.0)
        case .white:
            return Color(red: 1.0, green: 1.0, blue: 1.0)
        }
    }
}
