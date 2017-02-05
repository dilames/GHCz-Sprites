//
//  ViewController.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/4/17.
//  Copyright © 2017 com. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class MainViewController: NSViewController {
    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.skView {
            let scene = MainScene(size: CGSize(width: view.frame.width, height: view.frame.height))
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

