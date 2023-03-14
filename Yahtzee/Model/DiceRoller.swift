//
//  DiceRoller.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 09/03/2023.
//

import Foundation

protocol DiceRollerRepresentative {
    func roll() -> [Int]
//    func reset(for dice: inout [Int])
}

final class DiceRoller: DiceRollerRepresentative {
    
//    init(dice: [Int], availableDice: [Int]) {
//        self.dice = dice
//        self.availableDice = availableDice
//    }
//
//    var dice: [Int] = [1, 1, 1, 1, 1]
//    var availableDice: [Int]
//
    func roll() -> [Int] {
        return Array(repeating: 1, count: 5).map { _ in (1...6).randomElement()! }
    }
    
//    func reset(for dice: inout [Int]) {
//        dice = [1, 1, 1, 1, 1]
//    }
}
