//
//  MainScene + Controls.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension MainScene {
    
    override func mouseDown(with event: NSEvent) {
        self.checkCollision(in: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch (event.characters!, event.keyCode)  {
        case ("=", 0x18): self.zoomIn()
        case ("-", 0x1B): self.zoomOut()
        case (_, 0x7E): self.moveCamera(to: .top)
        case (_, 0x7D): self.moveCamera(to: .bottom)
        case (_, 0x7C): self.moveCamera(to: .right)
        case (_, 0x7B): self.moveCamera(to: .left)
        case ("0", 0x1D): self.processAlgorithm()
        default: Debuger.dprint(object: "Scene keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    override func scrollWheel(with event: NSEvent) {
        super.scrollWheel(with: event)
        
        Debuger.dprint(object: "Scrolling event: x[\(event.scrollingDeltaX)] y:[\(event.scrollingDeltaY)]")
    }
    
    
    // MARK: Zooming
    private func zoomIn() {
        guard let camera = self.camera else { Debuger.dprint(object: "Scene Zoom In: Camera don't installed "); return }
        
        let currentScale = camera.xScale
        Debuger.dprint(object: "Zoom In current scale: \(currentScale)")
        if currentScale >= 0.1 { camera.setScale(currentScale - 0.01) }
    }
    
    private func zoomOut() {
        guard let camera = self.camera else { Debuger.dprint(object: "Scene Zoom Out: Camera don't installed "); return }
        
        let currentScale = camera.xScale
        Debuger.dprint(object: "Zoom Out scale: \(currentScale)")
        
        if currentScale <= 1.0 { camera.setScale(currentScale + 0.01) }
        
    }
    
    // MARK: Movement
    
    enum cameraMovingDirection {
        case top
        case bottom
        case left
        case right
    }
    
    private func moveCamera(to direction: cameraMovingDirection) {
        guard let camera = self.camera else { Debuger.dprint(object: "Scene Move Action: Camera don't installed "); return }
        
        let pixelsToMove = 200.0 / camera.xScale
        
        switch direction {
        case .top:      camera.position.y += pixelsToMove; Debuger.dprint(object: "Move Top action camera position: [\(camera.position.x)][\(camera.position.y)]")
        case .bottom:   camera.position.y -= pixelsToMove; Debuger.dprint(object: "Move Bottom action camera position: [\(camera.position.x)][\(camera.position.y)]")
        case .left:     camera.position.x -= pixelsToMove; Debuger.dprint(object: "Move Left action camera position: [\(camera.position.x)][\(camera.position.y)]")
        case .right:    camera.position.x += pixelsToMove; Debuger.dprint(object: "Move Right action camera position: [\(camera.position.x)][\(camera.position.y)]")
        }
    }
}
