//
//  GameBrain.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 28/10/2022.
//

import UIKit

struct GameBrain {
    
    //Dice Array
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    let diceDict = [#imageLiteral(resourceName: "DiceOne"): 1, #imageLiteral(resourceName: "DiceTwo"): 2, #imageLiteral(resourceName: "DiceThree"): 3, #imageLiteral(resourceName: "DiceFour"): 4, #imageLiteral(resourceName: "DiceFive"): 5, #imageLiteral(resourceName: "DiceSix"): 6]
    
    var diceOneValue = 0
    var diceTwoValue = 0
    var diceThreeValue = 0
    var diceFourValue = 0
    var diceFiveValue = 0
    
    var moveCount = 0
    
    mutating func updateValue(_ d1: UIImage, _ d2: UIImage, _ d3: UIImage, _ d4: UIImage, _ d5: UIImage){
        diceOneValue = diceDict[d1]!
        diceTwoValue = diceDict[d2]!
        diceThreeValue = diceDict[d3]!
        diceFourValue = diceDict[d4]!
        diceFiveValue = diceDict[d5]!
    }
    
    //Saved Total Score
    var savedScore = 0
    //Upper Scoring Logic
    var ones = 0
    var twos = 0
    var threes = 0
    var fours = 0
    var fives = 0
    var sixes = 0
    //Lower Scoring Logic
    var threeOfAKind = 0
    var fourOfAKind = 0
    var fullHouse = 0
    var smallStraight = 0
    var largeStraight = 0
    var yahtzee = 0
    var chance = 0
    
    mutating func calculateOnes(){
        if diceOneValue == 1 {
            ones += 1
        }
        if diceTwoValue == 1 {
            ones += 1
        }
        if diceThreeValue == 1 {
            ones += 1
        }
        if diceFourValue == 1 {
            ones += 1
        }
        if diceFiveValue == 1 {
            ones += 1
        }
    }
    
    mutating func calculateTwos(){
        if diceOneValue == 2 {
            twos += 2
        }
        if diceTwoValue == 2 {
            twos += 2
        }
        if diceThreeValue == 2 {
            twos += 2
        }
        if diceFourValue == 2 {
            twos += 2
        }
        if diceFiveValue == 2 {
            twos += 2
        }
    }
    
    mutating func calculateThrees(){
        if diceOneValue == 3 {
            threes += 3
        }
        if diceTwoValue == 3 {
            threes += 3
        }
        if diceThreeValue == 3 {
            threes += 3
        }
        if diceFourValue == 3 {
            threes += 3
        }
        if diceFiveValue == 3 {
            threes += 3
        }
    }
    
    mutating func calculateFours(){
        if diceOneValue == 4 {
            fours += 4
        }
        if diceTwoValue == 4 {
            fours += 4
        }
        if diceThreeValue == 4 {
            fours += 4
        }
        if diceFourValue == 4 {
            fours += 4
        }
        if diceFiveValue == 4 {
            fours += 4
        }
    }
    
    mutating func calculateFives(){
        if diceOneValue == 5 {
            fives += 5
        }
        if diceTwoValue == 5 {
            fives += 5
        }
        if diceThreeValue == 5 {
            fives += 5
        }
        if diceFourValue == 5 {
            fives += 5
        }
        if diceFiveValue == 5 {
            fives += 5
        }
    }
    
    mutating func calculateSixes(){
        if diceOneValue == 6 {
            sixes += 6
        }
        if diceTwoValue == 6 {
            sixes += 6
        }
        if diceThreeValue == 6 {
            sixes += 6
        }
        if diceFourValue == 6 {
            sixes += 6
        }
        if diceFiveValue == 6 {
            sixes += 6
        }
    }
    
    mutating func calculateThreeOfAKind(){
        // use while loop to add values to array if match previous iterable. Start array building with 1, loop to see if other 1s to add, if three+, then add totalValue to threeOfAKind. If not, add +1 to build and repeat process.
        
        let totalValue = diceOneValue + diceTwoValue + diceThreeValue + diceFourValue + diceFiveValue
        let valueArray = [diceOneValue, diceTwoValue, diceThreeValue, diceFourValue, diceFiveValue]
        var checker = [Int]()
        var count = 1
        
        while count < 7 {
            for i in valueArray {
                if i == count {
                    checker.append(i)
                    if checker.count >= 3 {
                        threeOfAKind = totalValue
                        count = 8
                    }
                } else if i != count {
                    continue
                }
            }
            checker = []
            count += 1
        }
    }
    
    mutating func calculateFourOfAKind(){
        let totalValue = diceOneValue + diceTwoValue + diceThreeValue + diceFourValue + diceFiveValue
        let valueArray = [diceOneValue, diceTwoValue, diceThreeValue, diceFourValue, diceFiveValue]
        var checker = [Int]()
        var count = 1
        
        while count < 7 {
            for i in valueArray {
                if i == count {
                    checker.append(i)
                    if checker.count >= 4 {
                        fourOfAKind = totalValue
                        count = 8
                    }
                } else if i != count {
                    continue
                }
            }
            checker = []
            count += 1
        }
    }
    
    //function: Bool value to see if Three of a Kind function works. Then it's just a case of figuring out, and checking, the other two dice.
    mutating func calculateFullHouse(){
        let valueArray = [diceOneValue, diceTwoValue, diceThreeValue, diceFourValue, diceFiveValue]
        var checker = [Int]()
        var checker2 = [Int]()
        var finalCheck = [Int]()
        var twoOfAKindCheck = [Int]()
        var count = 1
        var count2 = 1
        var isThreeOfAKind = false
        var isFullHouse = false
        
        //three of a kind function check
        while count < 7 {
            for i in valueArray {
                if i == count {
                    checker.append(i)
                    if checker.count == 3 {
                        isThreeOfAKind = true
                        finalCheck = checker
                        break
                    }
                } else if i != count {
                    continue
                }
            }
            checker = []
            count += 1
        }
        //four of a kind function check
        while count2 < 7 {
            for i in valueArray {
                if i == count2 {
                    checker2.append(i)
                    if checker2.count >= 4 {
                        isThreeOfAKind = false
                        finalCheck = checker2
                        count2 = 8
                    }
                } else if i != count2 {
                    continue
                }
            }
            checker2 = []
            count2 += 1
        }
        
        if isThreeOfAKind {
            for x in valueArray {
                if x != finalCheck[0] {
                    twoOfAKindCheck.append(x)
                }
            }
            if twoOfAKindCheck[0] == twoOfAKindCheck[1]{
                isFullHouse = true
                if isFullHouse{
                    fullHouse = 25
                }
            }
        }
    }
    
    mutating func calculateSmallStraight(){
        let valueArray = [diceOneValue, diceTwoValue, diceThreeValue, diceFourValue, diceFiveValue]
        let removeDuplicate = Set(valueArray)
        let sortedArray = removeDuplicate.sorted()
        let checker = [sortedArray[0]]
        var b = 9
        var c = 9
        var d = 9
        var e = 9
        let a = sortedArray[0]
        if sortedArray.count > 1 {
            b = sortedArray[1]
        }
        if sortedArray.count > 2 {
            c = sortedArray[2]
        }
        if sortedArray.count > 3{
            d = sortedArray[3]
        }
        if sortedArray.count > 4{
            e = sortedArray[4]
        }
        
        if a == checker.first! && b == checker.first! + 1 && c == checker.first! + 2 && d == checker.first! + 3 {
            smallStraight = 30
        }
        
        if b == checker.first! && c == checker.first! + 1 && d == checker.first! + 2 && e == checker.first! + 3 {
            smallStraight = 30
        }
    }
    
    mutating func calculateLargeStraight(){
        let valueArray = [diceOneValue, diceTwoValue, diceThreeValue, diceFourValue, diceFiveValue]
        let removeDuplicate = Set(valueArray)
        let sortedArray = removeDuplicate.sorted()
        let checker = [sortedArray[0]]
        var b = 9
        var c = 9
        var d = 9
        var e = 9
        
        let a = sortedArray[0]
        if sortedArray.count > 1 {
            b = sortedArray[1]
        }
        if sortedArray.count > 2 {
            c = sortedArray[2]
        }
        if sortedArray.count > 3{
            d = sortedArray[3]
        }
        if sortedArray.count > 4{
            e = sortedArray[4]
        }
        
        if a == checker.first! && b == checker.first! + 1 && c == checker.first! + 2 && d == checker.first! + 3 && e == checker.first! + 4 {
            largeStraight = 40
        }
    }
    
    mutating func calculateChance(){
        let totalValue = diceOneValue + diceTwoValue + diceThreeValue + diceFourValue + diceFiveValue
        chance = totalValue
    }
    
    mutating func calculateYahtzee(){
        if diceOneValue == diceTwoValue && diceTwoValue == diceThreeValue && diceThreeValue == diceFourValue && diceFourValue == diceFiveValue {
            yahtzee += 50
        }
    }
    
    func hideSet(d1: UIImageView, d2: UIImageView, d3: UIImageView, d4: UIImageView, d5: UIImageView){
        d1.isHidden = true
        d2.isHidden = true
        d3.isHidden = true
        d4.isHidden = true
        d5.isHidden = true
    }
    
    func unhideSet(d1: UIImageView, d2: UIImageView, d3: UIImageView, d4: UIImageView, d5: UIImageView){
        d1.isHidden = false
        d2.isHidden = false
        d3.isHidden = false
        d4.isHidden = false
        d5.isHidden = false
    }
    
    func hideAndDisplay(dice: UIImageView, dice2: UIImageView){
        dice.isHidden = true
        dice2.isHidden = false
    }
    
    func resetDiceImages(d1: UIImageView, d2: UIImageView, d3: UIImageView, d4: UIImageView, d5: UIImageView){
        d1.image = #imageLiteral(resourceName: "DiceSix")
        d2.image = #imageLiteral(resourceName: "DiceSix")
        d3.image = #imageLiteral(resourceName: "DiceSix")
        d4.image = #imageLiteral(resourceName: "DiceSix")
        d5.image = #imageLiteral(resourceName: "DiceSix")
    }
    
    func disableScores(S1: UIButton, S2: UIButton, S3: UIButton, S4: UIButton, S5: UIButton, S6: UIButton, S7: UIButton, S8: UIButton, S9: UIButton, S10: UIButton, S11: UIButton, S12: UIButton, S13: UIButton){
        S1.isEnabled = false
        S2.isEnabled = false
        S3.isEnabled = false
        S4.isEnabled = false
        S5.isEnabled = false
        S6.isEnabled = false
        S7.isEnabled = false
        S8.isEnabled = false
        S9.isEnabled = false
        S10.isEnabled = false
        S11.isEnabled = false
        S12.isEnabled = false
        S13.isEnabled = false
    }
}
