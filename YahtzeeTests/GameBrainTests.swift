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
    
    func testWhenThreeTwosAppearThenReturnEighteen() throws {
        //Given
        let gameBrain = GameBrain1([2,2,2,6,6])
        
        //When
        let actualResult = gameBrain.threeOfAKind()
        let expectedResult = 18
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenFourFivesAppearThenReturnSeventeen() throws {
        //Given
        let gameBrain = GameBrain1([4, 4, 4, 1, 4])
        
        //When
        let actualResult = gameBrain.fourOfAKind()
        let expectedResult = 17
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeTwosAndTwoFivesAppearThenReturnTwentyFive() throws {
        //Given
        let gameBrain = GameBrain1([2, 2, 2, 5, 5])
        
        //When
        let actualResult = gameBrain.fullHouse()
        let expectedResult = 25
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenTwoAndThreeAndFourAndFiveAppearThenReturnThirty() throws {
        //Given
        let gameBrain = GameBrain1([2, 3, 4, 5, 3])
        
        //When
        let actualResult = gameBrain.smallStraight()
        let expectedResult = 30
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenOneAndTwoAndThreeAndFourAndFiveAppearThenReturnForty() throws {
        //Given
        let gameBrain = GameBrain1([1, 2, 3, 4, 5])
        
        //When
        let actualResult = gameBrain.largeStraight()
        let expectedResult = 40
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenFiveSixesAppearThenReturnFifty() throws {
        //Given
        let gameBrain = GameBrain1([6, 6, 6, 6, 6])
        
        //When
        let actualResult = gameBrain.yahtzee()
        let expectedResult = 50
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenThreeTwosAndOneFourAndOneSixAppearThenReturnSixteen() throws {
        //Given
        let gameBrain = GameBrain1([2, 2, 2, 4, 6])
        
        //When
        let actualResult = gameBrain.chance()
        let expectedResult = 16
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
}


