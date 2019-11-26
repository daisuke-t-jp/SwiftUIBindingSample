//
//  Person.swift
//  SwiftUIBindingSample
//
//  Created by Daisuke TONOSAKI on 2019/11/26.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import Foundation
import SwiftUI

struct Person: Hashable, Codable, Identifiable {
    
    // MARK: - Enum, Const
    enum Gender: Int, CaseIterable, Codable, Hashable {
        case male = 0
        case female = 1
    }
    
    
    // MARK: - Property
    static var idCounter: Int = 0
    
    var id: Int
    var name: String
    var gender: Gender  // Picker(Segment)
    var age: Int        // Picker(Wheel)
    var hasGlasses: Bool    // Toggle
    var pocketMoney: Int    // TextField
    
    
    // Initializer
    init() {
        self.id = Person.idCounter
        Person.idCounter += 1
        
        self.name = "NO NAME"
        self.gender = .male
        self.age = 20
        self.hasGlasses = true
        self.pocketMoney = 0
    }
    
    init(name: String, gender: Gender, age: Int, hasGlasses: Bool, pocketMoney: Int) {
        self.id = Person.idCounter
        Person.idCounter += 1
        
        self.name = name
        self.gender = gender
        self.age = age
        self.hasGlasses = hasGlasses
        self.pocketMoney = pocketMoney
    }
    
}
