//
//  SKCamera.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/8/17.
//  Copyright © 2017 com. All rights reserved.
//

import Cocoa
import SpriteKit

class SKCamera: SKCameraNode {
    
    private var playableRect: CGRect { return CGRect(x: 0, y: 0, width: 2550, height: 1440) }
    private var cameraRect: CGRect {
        let x = self.position.x - playableRect.width
        let y = self.position.y - playableRect.height
        return CGRect(x: x, y: y, width: playableRect.width, height: playableRect.height)
    }
    
    init(scene: SKScene) {
        super.init()
        self.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
}
