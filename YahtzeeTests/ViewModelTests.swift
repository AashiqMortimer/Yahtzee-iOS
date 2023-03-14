//
//  ViewModelTests.swift
//  YahtzeeTests
//
//  Created by Aashiq Mortimer on 09/03/2023.
//

import Foundation

import XCTest
@testable import Yahtzee

final class DummyDiceRoller: DiceRollerRepresentative {
    var dice: [Int] = [0, 0, 0, 0, 0]
    
    func roll() -> [Int] {
        return dice
    }
}


final class ViewModelTests: XCTestCase {
    let gameBrain = GameBrain1()
    let dummyDiceRoller = DummyDiceRoller()
    
    func testWhenDummyDiceRollerReturnsTwosThenTwoOfAKindEqualsTen() {
        let viewModel = ViewModel(gameBrain: gameBrain, diceRoller: dummyDiceRoller)
        
        dummyDiceRoller.dice = [2, 2, 2, 2, 2]
        
        viewModel.rollDice()
        
        let expectedResult = "10"
        
        let actualResult = viewModel.twoOfAKindValue
        
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    //Write one more test to play around with it and understand it further. 
    
    func testWhenDummyDiceRollerEqualsOnesThenOneOfAKindEqualsFive() {
        let viewModel = ViewModel(gameBrain: gameBrain, diceRoller: dummyDiceRoller)
        
        dummyDiceRoller.dice = [1, 1, 1, 1, 1]
        
        viewModel.rollDice()
        
        let expectedResult = "5"
        
        let actualResult = viewModel.oneOfAKindValue
        
        XCTAssertEqual(expectedResult, actualResult)
        
        
        
    }
    
    func testExample() {
        let viewModel = ViewModel(gameBrain: gameBrain, diceRoller: dummyDiceRoller)
        
        
        
    }
    
    
    
}

