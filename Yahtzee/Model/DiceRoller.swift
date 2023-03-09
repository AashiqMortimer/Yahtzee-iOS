//
//  DiceRoller.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 09/03/2023.
//

import Foundation

protocol DiceRollerRepresentative {
    func roll(for availableDice: [Int]) -> [Int]
    func reset(for dice: inout [Int])
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
    func roll(for availableDice: [Int]) -> [Int] {
        let rand = [1, 2, 3, 4, 5, 6]
        return availableDice.map { _ in rand.randomElement()! }
    }
    
    func reset(for dice: inout [Int]) {
        dice = [1, 1, 1, 1, 1]
    }
}
