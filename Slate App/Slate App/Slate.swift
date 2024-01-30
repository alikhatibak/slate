//
//  Slate.swift
//  Slate App
//
//  Created by Ali Khatib on 1/28/24.
//

import Foundation
import SwiftData

@Model
final class Slate {
    var timestamp: Date
    var production_title: String = ""
    var take: Int = 1
    var scene: Int = 1
    var roll: Int = 1
    var slate_identifier: Int = 1
    var fps: Int = 24
    var camera_identifier: String = "A"
    var director: String = ""
    var dop: String = ""
    var exterior: Bool = true
    var interior: Bool = false
    var day: Bool = true
    var night: Bool = false
    var sync: Bool = true
    var mos: Bool = false
    var notes: String = ""
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
