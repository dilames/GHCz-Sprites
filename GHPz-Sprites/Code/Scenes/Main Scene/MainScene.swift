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
    
    internal var pizza = Array<Array<SKCell>>()
    
    override func update(_ currentTime: TimeInterval) {
        self.currentTime = currentTime
        
    }
    
    override func didMove(to view: SKView) {
        self.locateSKCells()
        
    }
    
}
