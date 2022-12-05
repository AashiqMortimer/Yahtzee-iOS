//
//  GameBrainTests.swift
//  YahtzeeTests
//
//  Created by Aashiq Mortimer on 29/11/2022.
//

import XCTest
@testable import Yahtzee

final class GameBrainTests: XCTestCase {
    
    func testWhenNoOnesAppearThenOnesReturnsZero() throws {
        //Given
        let gameBrain = GameBrain1([6, 6, 6, 6, 6])
        
        //When
        let actualResult = gameBrain.ones()
        let expectedResult = 0
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
        
    }
    
    func testWhenTwoOnesAppearThenOnesReturnsTwo() throws {
        //Given
        let gameBrain = GameBrain1([1, 1, 6, 6, 6])
        
        //When
        let actualResult = gameBrain.ones()
        let expectedResult = 2
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    
    }

}
