//
//  Data Provider.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

class DataProvider {
    static let `default` = DataProvider(file: F.Path.smallInputData)
    
    private(set) var row:    Int = 0
    private(set) var column: Int = 0
    private(set) var min:    Int = 0
    private(set) var max:    Int = 0
    
    private(set) var parcedArray = [String]()
    
    required init(file: String) {
        self.parce(from: file)
    }
    
    private func parce(from file: String) {
        do {
            let str = try String(contentsOfFile: file)
            _ = str.components(separatedBy: " ").map {
                guard $0.components(separatedBy: "\n").count == 1 else {
                    _ = $0.components(separatedBy: "\n").map { parcedArray.append($0) }
                    return
                }
                parcedArray.append($0)
            }
            self.row = Int(parcedArray.removeFirst())!
            self.column = Int(parcedArray.removeFirst())!
            self.min = Int(parcedArray.removeFirst())!
            self.max = Int(parcedArray.removeFirst())!
            parcedArray.removeLast()
        }
        catch {
            Debuger.print(object: "Error while reading object: \(file)")
        }
    }
}
