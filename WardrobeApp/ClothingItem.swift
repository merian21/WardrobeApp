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
}
