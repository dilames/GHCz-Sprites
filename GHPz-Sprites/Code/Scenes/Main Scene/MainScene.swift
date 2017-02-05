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
        self.locateSKCells()
    }
    
    override func mouseDown(with event: NSEvent) {
        let pos = event.location(in: self)
        print(pos)
        self.setScale(0.5)
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31: break;
        default: print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
}
