//
//  Debuger.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

class Debuger {
    static let `default` = Debuger()
    
    static var isEnabled: Bool = true
    
    class func print(object: Any?) {
        guard isEnabled == true else { return }
        print(object: object)
    }
    
}
