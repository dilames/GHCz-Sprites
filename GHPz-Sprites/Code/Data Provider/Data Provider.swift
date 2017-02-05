//
//  Data Provider.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

class DataProvider {
    static let `default` = DataProvider(file: F.Path.mediumInputData)
    
    private(set) var row:    Int = 0
    private(set) var column: Int = 0
    private(set) var min:    Int = 0
    private(set) var max:    Int = 0
    
    private(set) var rawElementsArray = [String]()
    
    required init(file: String) {
        self.parce(from: file)
    }
    
    private func parce(from file: String) {
        do {
            let str = try String(contentsOfFile: file)
            _ = str.components(separatedBy: " ").map {
                guard $0.components(separatedBy: "\n").count == 1 else {
                    _ = $0.components(separatedBy: "\n").map { rawElementsArray.append($0) }
                    return
                }
                rawElementsArray.append($0)
            }
            self.row = Int(rawElementsArray.removeFirst())!
            self.column = Int(rawElementsArray.removeFirst())!
            self.min = Int(rawElementsArray.removeFirst())!
            self.max = Int(rawElementsArray.removeFirst())!
            rawElementsArray.removeLast()
        }
        catch {
            Debuger.dprint(object: "Error while reading object: \(file)")
        }
    }
}
