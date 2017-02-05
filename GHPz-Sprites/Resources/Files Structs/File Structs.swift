//
//  File Structs.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

struct F {
    
    struct Path {
        static let bigInputData = Bundle.main.path(forResource: "big", ofType: "in")!
        static let mediumInputData = Bundle.main.path(forResource: "medium", ofType: "in")!
        static let smallInputData = Bundle.main.path(forResource: "small", ofType: "in")!
    }
    
    struct Image {
        
        struct Mushroom {
            static let selected = "Selected Mushroom"
            static let nonSelected = "Nonselected Mushroom"
        }
        
        struct Tomato {
            static let selected = "Selected Tomato"
            static let nonSelected = "Nonselected Tomato"
        }
    }
}
