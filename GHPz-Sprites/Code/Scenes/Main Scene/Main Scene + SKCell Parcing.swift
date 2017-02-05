//
//  Main Scene + SKCell Allocation.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

extension MainScene {
    func locateSKCells() {
        
        let spriteCellExample = SKCell(type: .mushroom, state: true)
        
        var pieceLocation = CGPoint(x: 0, y: self.frame.height - spriteCellExample.size.height - 20)
        for pieces in DataProvider.default.rawElementsArray {
            var pieceSprite: SKCell?
            for piece in pieces.characters {
                switch piece {
                case "T": pieceSprite = SKCell(type: .tomato, state: false)
                case "M": pieceSprite = SKCell(type: .mushroom, state: false)
                default: print("Unresolved piece")
                }
                
                guard let pieceSprite = pieceSprite else { return }
                pieceSprite.anchorPoint = .zero
                pieceSprite.position = pieceLocation
                pieceLocation.x += spriteCellExample.size.width + 10
                self.addChild(pieceSprite)
            }
            pieceLocation.y -= spriteCellExample.size.height + 10
            pieceLocation.x = 0
        }
    }
}
