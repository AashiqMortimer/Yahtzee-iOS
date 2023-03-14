//
//  ViewModel.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 08/12/2022.
//

import Foundation

protocol ViewModelRepresentable {
    var title: String { get }
    var oneOfAKindTitle: String { get }
    var oneOfAKindValue: String { get }
    var twoOfAKindTitle: String { get }
    var twoOfAKindValue: String { get }
}

struct ViewModel: ViewModelRepresentable {
    let gameBrain: GameBrain1
    let diceRoller: DiceRollerRepresentative
    
    let title: String = "Yahtzee"
    let rollTitle: String = "Roll"
    let oneOfAKindTitle: String = "One of a Kind"
    var oneOfAKindValue: String {
        get {
            String(gameBrain.ones())
        }
    }
    let twoOfAKindTitle: String = "Two of a Kind"
    var twoOfAKindValue: String {
        get {
            String(gameBrain.twos())
        }
    }
    
    func rollDice() {
        let dice = diceRoller.roll()
        gameBrain.dice = dice
    }
    
//    func rollDice() {
//        gameBrain.dice = diceRoller.roll(for: gameBrain.dice)
//    }
    
//    func resetDice() {
//        diceRoller.reset(for: &gameBrain.dice)
//    }
    
}

enum ViewModelState {
    case initial
    case playing
    case gameOver
}
