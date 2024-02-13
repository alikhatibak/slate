//
//  Scene.swift
//  Slate App
//
//  Created by Ali Khatib on 2/12/24.
//

import Foundation
import SwiftData

@Model
final class Scene {
    
    var convention: String = "US"
    var autoSlate: Bool = false
    var createdTimestamp: Date
    var productionTitle: String = ""
    var take: Int = 1
    var scene: Int = 1
    var shot: Int = 0 // US numbering uses letters, European numbering uses integers (US: 14C {Scene 14, Shot 3}, Europe: 14/3 {Scene 14 Shot 3})
    var roll: String = "A001"
    var slateIdentifier: Int = 1 // for UK numbering only, may still include visually for note taking, script supervisors sometimes find having a running count of all slates
    var fps: Double = 24.00 // add common framerates and offspeed support
    var cameraIdentifier: String = "A"
    var director: String = ""
    var dp: String = ""
    var exterior: Bool = true
    var interior: Bool = false
    var day: Bool = true
    var night: Bool = false
    var sync: Bool = true
    var mos: Bool = false
    var notes: String = "" // prob not how i want to handle this, placeholder
    
    init(timestamp: Date) {
        self.createdTimestamp = timestamp // sets created_timestamp to current time upon initialization
    }
    
    
// Setter Methods
    
    
//      Convention Setters
    
    func setConventionUS () {
        self.convention = "US" // Sets numbering convention to US style (Scene = Int, Shot = Char, no seperator)
    }
    func setConventionUK () {
        self.convention = "UK" // Sets numbering convention to UK style (Scene = Int, Shot = NA, slate_identifier used instead, continuos update on every take increment
    }
    func setConventionEU () {
        self.convention = "EU" // Sets numbering convention to EU style (Scene = Int, Shot = Int, "/" seperator)
    }

//      Var Setters
    
    func setProductionTitle (title: String) {
        self.productionTitle = title
    }
    func setDirector (directorname: String) {
        self.director = directorname
    }
    func setDp (dpname: String) {
        self.dp = dpname
    }
    func setExterior () {
        self.exterior = true
        self.interior = false
    }
    func setInterior () {
        self.interior = true
        self.exterior = false
    }
    func setDay () {
        self.day = true
        self.night = false
    }
    func setNight () {
        self.night = true
        self.day = false
    }
    func setSync () {
        self.sync = true
        self.mos = false
    }
    func setMos () {
        self.mos = true
        self.sync = false
    }
    
//    State Setters - #todo Take, Scene, Shot, Roll, FPS, Slate Identifier, ?Camera Identifier?
    
    func setTake (takenumber: Int) {
        self.take = takenumber
    }
    func setShot (shotnumber: Int) {
        self.shot = shotnumber
        self.take = 1
    }
    func setScene (scenenumber: Int) {
        self.scene = scenenumber
        self.shot = 1
        self.take = 1
    }
    func setRoll (rollnumber: String) {
        self.roll = rollnumber
    }
    func setFps (framerate: Double) {
        self.fps = framerate // Want to implement a couple of default framerates to choose, as well as a custom field. Current code suffices for custom framerate
    }
    func setSlateIdentifier (slateNumber: Int) {
        self.slateIdentifier = slateNumber
    }
    func setCameraIdentifier (cameraIdentifier: String) {
        self.cameraIdentifier = cameraIdentifier
    }
    
// Increment Methods
    
    
    func takeIncrement () {
        self.take += 1
        self.slateIdentifier += 1
    }
    func shotIncrement () {
        self.shot += 1
        self.take = 1
        self.slateIdentifier += 1
    }
    func sceneIncrement () {
        self.scene += 1
        self.take = 1 // can take be stored by scene? If user increments to next scene accidentally, I want them to be able to navigate back to previous scene and have the last unused take numver available.
        self.shot = 1 // same as above, save shot information by scene, raises the question of having a 0 shot, for master shot (i.e. 14 = scene 14 master shot, 14A = a cam closeup, etc) maybe make it an option someday.
        self.slateIdentifier += 1
    }
    
}

