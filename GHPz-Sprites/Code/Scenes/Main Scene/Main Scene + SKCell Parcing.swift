//
//  Main Scene + SKCell Allocation.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

fileprivate let heightMarginOffset : CGFloat = 5.0
fileprivate let standartOffset     : CGFloat = 5.0

extension MainScene {
    
    func locateSKCells() {
        
        var location = CGPoint(x: 0, y: self.size.height - SKCell.example.size.height - heightMarginOffset)
        
        for rawPieces in DataProvider.default.rawElementsArray {
            
            var piece: SKCell?
            var rowFromPieces = [SKCell]()
            
            for rawPiece in rawPieces.characters {
                
                if rawPiece == "T" { piece = SKCell(type: .tomato, state: false) }
                else { piece = SKCell(type: .mushroom, state: false) }
                
                guard let piece = piece else { Debuger.dprint(object: "Piece can not be unwrapped"); return }
                
                piece.anchorPoint = .zero
                piece.position = location
                location.x += SKCell.example.size.width + standartOffset
                rowFromPieces.append(piece)
                addChild(piece)
            }
            location.y -= SKCell.example.size.height + standartOffset
            location.x = 0
            pizza.append(rowFromPieces)
        }
    }
}
