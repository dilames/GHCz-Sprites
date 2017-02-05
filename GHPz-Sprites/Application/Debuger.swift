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
    
    var isEnabled: Bool { return true }
    
    class func dprint(object: Any) {
        guard self.default.isEnabled == true else { return }
        print(object)
    }
    
}
