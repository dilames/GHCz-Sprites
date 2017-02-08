//
//  ViewController.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/4/17.
//  Copyright © 2017 com. All rights reserved.
//

import Cocoa
import SpriteKit

class MainViewController: NSViewController {
    @IBOutlet var skView: SKView!
    
    fileprivate let scene = MainScene(size: CGSize(width: SKCell.example.frame.size.width * CGFloat(DataProvider.default.column + 5),
                                                   height: SKCell.example.frame.size.height * CGFloat(DataProvider.default.row + 5)))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.skView {
            
            self.scene.scaleMode = .aspectFit
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
    }
    
    
    override func scrollWheel(with event: NSEvent) {
        scene.scrollWheel(with: event)
    }
    
    
}

