//
//  Data Provider.swift
//  GHPz-Sprites
//
//  Created by Andrew Chersky on 2/5/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

struct AlgorithmStep {
    var row: Int!
    var column: Int!
    var state: Bool!
}

class DataProvider {
    static let `default` = DataProvider()
    
    private(set) var row:    Int = 0
    private(set) var column: Int = 0
    private(set) var min:    Int = 0
    private(set) var max:    Int = 0
    
    private(set) var rawElementsArray = [String]()
    private(set) var algoSteps = [AlgorithmStep]()
    
    required init() {
        let sourcePizzaFile = F.Path.smallInputData
        let sourceAlgorithmFile = F.Path.AlgoExample
        self.parce(from: sourcePizzaFile)
        self.parceAlgorithm(from: sourceAlgorithmFile)
    }
    
    open func reinitialize(for scene: MainScene) {
        let sourcePizzaFile = F.Path.mediumInputData
        let sourceAlgorithmFile = F.Path.AlgoExample
        
        
        
        self.rawElementsArray.removeAll()
        self.algoSteps.removeAll()
        scene.deallocateSKCells()
        self.parce(from: sourcePizzaFile)
        self.parceAlgorithm(from: sourceAlgorithmFile)
        scene.locateSKCells()
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
        } catch {
            Debuger.dprint(object: "Error while reading object: \(file)")
        }
    }
    
    private func parceAlgorithm(from file: String) {
        do {
            let str = try String(contentsOfFile: file)
            _ = str.components(separatedBy: "\n").map {
                var step = AlgorithmStep()
                _ = $0.components(separatedBy: " ").map {
                    if step.row == nil { step.row = Int($0) }
                    else if step.column == nil { step.column = Int($0) }
                    else if step.state == nil { step.state = Int($0) == 1 ? true : false }
                }
                algoSteps.append(step)
            }
            algoSteps.removeLast()
        } catch {
            Debuger.dprint(object: "Error while reading object: \(file)")
        }
    }
}
