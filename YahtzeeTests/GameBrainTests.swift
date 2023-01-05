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
    
    func testWhenNoTwosAppearThenTwosReturnZero() throws {
        //Given
        let gameBrain = GameBrain1([1,1,6,6,6])
        
        //When
        let actualResult = gameBrain.twos()
        let expectedResult = 0
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeTwosAppearThenTwosReturnSix() throws {
        //Given
        let gameBrain = GameBrain1([2,2,2,6,6])
        
        //When
        let actualResult = gameBrain.twos()
        let expectedResult = 6
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenNoThreesAppearThenThreesReturnZero() throws {
        //Given
        let gameBrain = GameBrain1([1,1,6,6,6])
        
        //When
        let actualResult = gameBrain.threes()
        let expectedResult = 0
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenTwoThreesAppearThenThreesReturnSix() throws {
        //Given
        let gameBrain = GameBrain1([3,3,2,6,6])
        
        //When
        let actualResult = gameBrain.threes()
        let expectedResult = 6
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenNoFoursAppearThenFoursReturnZero() throws {
        //Given
        let gameBrain = GameBrain1([1,1,6,6,6])
        
        //When
        let actualResult = gameBrain.fours()
        let expectedResult = 0
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeFoursAppearThenFoursReturnTwelve() throws {
        //Given
        let gameBrain = GameBrain1([3,3,4,4,4])
        
        //When
        let actualResult = gameBrain.fours()
        let expectedResult = 12
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenNoFivesAppearThenFivesReturnZero() throws {
        //Given
        let gameBrain = GameBrain1([1,1,1,6,6])
        
        //When
        let actualResult = gameBrain.fives()
        let expectedResult = 0
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeFivesAppearThenFivesReturnFifteen() throws {
        //Given
        let gameBrain = GameBrain1([3,3,5,5,5])
        
        //When
        let actualResult = gameBrain.fives()
        let expectedResult = 15
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenNoSixesAppearThenSixesReturnZero() throws {
        //Given
        let gameBrain = GameBrain1([1,1,1,5,5])
        
        //When
        let actualResult = gameBrain.sixes()
        let expectedResult = 0
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeSixesAppearThenSixesReturnEighteen() throws {
        //Given
        let gameBrain = GameBrain1([3,3,6,6,6])
        
        //When
        let actualResult = gameBrain.sixes()
        let expectedResult = 18
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeTwosReturnEighteen() throws {
        //Given
        let gameBrain = GameBrain1([2,2,2,6,6])
        
        //When
        let actualResult = gameBrain.calculateThreeOfAKind()
        let expectedResult = 18
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    
}


