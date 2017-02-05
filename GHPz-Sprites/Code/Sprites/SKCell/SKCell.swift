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
    
    static var example : SKCell = { return SKCell(type: cellType.mushroom, state: true) }()
    
    open var type: cellType {
        didSet {
            guard oldValue != type else { Debuger.dprint(object: "SKCell - Cell state same as previous."); return }
            self.texture = SKCell.initializeCellTexture(with: self.type, in: self.isSelected)
        }
    }
    open var isSelected: Bool {
        didSet {
            guard oldValue != isSelected else { Debuger.dprint(object: "SKCell - Cell state same as previous."); return }
            self.texture = SKCell.initializeCellTexture(with: self.type, in: self.isSelected)
        }
    }
    
    init(type: cellType, state: Bool) {
        self.type = type
        self.isSelected = state
        
        let texture = SKCell.initializeCellTexture(with: type, in: state)
        
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static private func initializeCellTexture(with type: cellType, in state: Bool) -> SKTexture {
        switch (type, state) {
        case (.mushroom, true): return SKTexture(imageNamed: F.Image.Mushroom.selected)
        case (.mushroom, false): return SKTexture(imageNamed: F.Image.Mushroom.nonSelected)
        case (.tomato, true): return SKTexture(imageNamed: F.Image.Tomato.selected)
        case (.tomato, false): return SKTexture(imageNamed: F.Image.Tomato.nonSelected)
        }
    }
    
}
