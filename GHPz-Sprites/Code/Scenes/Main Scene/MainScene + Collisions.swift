//
//  MainScene + Collisions.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension MainScene {
    
    func checkCollision(in location: CGPoint) {
        
        for rowFromPieces in pizza {
            for piece in rowFromPieces {
                if piece.contains(location) {
                    piece.isSelected = !piece.isSelected
                    break
                }
            }
        }
    }
    
    func processAlgorithm() {
        DispatchQueue.main.async {
            var color = SKColor.red
            
            DataProvider.default.reinitialize(for: self)
            for step in DataProvider.default.algoSteps {
                if step.column == nil {
                    color = SKColor(calibratedRed: CGFloat(arc4random()) / CGFloat(UInt32.max),
                                    green: CGFloat(arc4random()) / CGFloat(UInt32.max),
                                    blue: CGFloat(arc4random()) / CGFloat(UInt32.max),
                                    alpha: 1.0)
                } else {
                    let cell = self.pizza[step.row][step.column]
                    cell.setState(state: step.state, centeringMode: true)
                    cell.run(SKAction.colorize(with: color, colorBlendFactor: 0.75, duration: 0.0))
                }
            }
            self.camera?.setScale(1.0)
            self.camera?.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        }
    }
    
}
