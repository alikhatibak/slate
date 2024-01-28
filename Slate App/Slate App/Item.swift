//
//  Item.swift
//  Slate App
//
//  Created by Ali Khatib on 1/28/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
