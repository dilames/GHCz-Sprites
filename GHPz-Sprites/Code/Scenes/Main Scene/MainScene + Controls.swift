//
//  MainScene + Controls.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension MainScene {
    
    override func mouseDown(with event: NSEvent) {
        
        for rowFromPieces in pizza {
            for piece in rowFromPieces {
                if piece.contains(event.location(in: self)) {
                    piece.isSelected = !piece.isSelected
                    break
                }
            }
        }
        
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31: break;
        default: print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
}
