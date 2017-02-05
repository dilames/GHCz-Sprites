//
//  SKCell.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import SpriteKit

class SKCell: SKSpriteNode {
    
    enum cellType {
        case mushroom
        case tomato
    }
    
    init(type: cellType, state: Bool) {
        let texture: SKTexture!
        
        switch (type, state) {
        case (.mushroom, true): texture = SKTexture(imageNamed: F.Image.Mushroom.selected)
        case (.mushroom, false): texture = SKTexture(imageNamed: F.Image.Mushroom.nonSelected)
        case (.tomato, true): texture = SKTexture(imageNamed: F.Image.Tomato.selected)
        case (.tomato, false): texture = SKTexture(imageNamed: F.Image.Tomato.nonSelected)
        }
        
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
