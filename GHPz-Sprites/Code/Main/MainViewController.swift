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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = CGSize(width: 1920, height: 1080)
        if let view = self.skView {
            let scene = MainScene(size: viewSize)
            scene.scaleMode = .aspectFit
            view.presentScene(scene)
            view.frame = NSRect(origin: .zero, size: viewSize)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

