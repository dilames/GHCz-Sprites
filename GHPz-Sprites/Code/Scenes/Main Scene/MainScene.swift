//
//  GameScene.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/4/17.
//  Copyright © 2017 com. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainScene: SKScene {
    private var currentTime: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    internal var deltaTime: TimeInterval {
        get {
            var dt: TimeInterval
            if lastUpdateTime > 0 { dt = currentTime - lastUpdateTime }
            else { dt = 0 }
            lastUpdateTime = currentTime
            return dt
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.currentTime = currentTime
        
    }
    
    override func didMove(to view: SKView) {
//        let sprite = SKCell(selected: false, type: .tomato)
//        var pieceLocation = CGPoint(x: 0, y: self.size.height - sprite.size.height - 20)
//        for pieces in DataPracer.default.array {
//            var pieceSprite: SKCell?
//            for piece in pieces.characters {
//                switch piece {
//                case "T": pieceSprite = SKCell(selected: false, type: .tomato)
//                case "M": pieceSprite = SKCell(selected: false, type: .mushroom)
//                default: print("Unresolved piece")
//                }
//                
//                guard let pieceSprite = pieceSprite else { return }
//                pieceSprite.anchorPoint = .zero
//                pieceSprite.position = pieceLocation
//                pieceLocation.x += sprite.size.width + 10
//                self.addChild(pieceSprite)
//            }
//            pieceLocation.y -= sprite.size.height + 10
//            pieceLocation.x = 0
//        }
        let camera = SKCameraNode()
        camera.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(camera)
        self.camera = camera
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31: break;
        default: print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
}
