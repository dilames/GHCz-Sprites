//
//  MainWindowController.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        
    }

}

// MARK: MainWindowController - <NSWindowDelegate>
extension MainWindowController: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        Debuger.dprint(object: "Application going to be terminated")
        NSApplication.shared().terminate(self)
    }
}
