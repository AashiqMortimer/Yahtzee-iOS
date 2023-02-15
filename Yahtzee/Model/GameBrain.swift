//
//  GameBrain.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 28/10/2022.
//

import UIKit

final class GameBrain1 {
    private let dices: [Int]
    
    init(_ dices: [Int]){
        self.dices = dices
    }
    
    func ones() -> Int {
        return calculateSingles(1)
    }
    
    private func calculateSingles(_ value: Int) -> Int {
        var count = 0
        
        //I returned an error when changing 'dice' to $0. Can we look at this?
        dices.forEach { dice in
            if dice == value{
                count += dice
            }
        }
        return count
    }
    
    func twos() -> Int {
        return calculateSingles(2)
    }
    
    func threes() -> Int {
        return calculateSingles(3)
    }
    
    func fours() -> Int {
        return calculateSingles(4)
    }
    
    func fives() -> Int {
        return calculateSingles(5)
    }
    
    func sixes() -> Int {
        return calculateSingles(6)
    }

    //threeOfAKind solution with Sets (trying to look at how to implement with a dictionary):
    
//    func calculateThreeOfAKind() -> Int {
//        let totalValue = dices.reduce(0, +)
//        var set = CountedSet<Int>()
//        dices.forEach{
//            set.insert($0)
//        }
//        return set.elements.values.filter{$0 >= 3}.count > 0 ? totalValue : 0
//    }
    
    // Attempts to implement 'calculateDuplicates' with dictionary for Three/Four of a Kind:
    
    func calculateDuplicates(_ value: Int) -> Int {
//        var diceDict = [Int: Int]()
//        var duplicateValue = [Int]()
//
//        for (diceNum, value) in dices.enumerated(){
//
//            if diceDict[value] != nil {
//                diceDict.updateValue(value, forKey: diceNum)
//            } else {
//                duplicateValue.append(value)
//            }
//        }
        return 0
    }
    
    func calculateThreeOfAKind() -> Int {
        return 0
    }
}

struct CountedSet<Element: Hashable> {
    private(set) var elements: [Element: Int] = [:]
    mutating func insert(_ member: Element) {
        elements[member, default: 0] += 1
    }
    mutating func remove(_ member: Element) -> Element? {
        guard var count = elements[member], count > 0 else { return nil }
        count -= 1
        elements[member] = count == 0 ? nil : count
        return member
    }
    subscript(_ member: Element) -> Int {
        elements[member] ?? 0
    }
}

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
    let moveArray = [0: 3,
                     1: 2,
                     2: 1,
                     3: 0]
    var roundCount = 1
    
    mutating func updateValue(_ d1: UIImage, _ d2: UIImage, _ d3: UIImage, _ d4: UIImage, _ d5: UIImage){
        diceOneValue = diceDict[d1]!
        diceTwoValue = diceDict[d2]!
        diceThreeValue = diceDict[d3]!
        diceFourValue = diceDict[d4]!
        diceFiveValue = diceDict[d5]!
    }
    
    //Saved Total Score
    var savedScore = 0
    //Lower Scoring Logic
    var threeOfAKind = 0
    var fourOfAKind = 0
    var fullHouse = 0
    var smallStraight = 0
    var largeStraight = 0
    var yahtzee = 0
    var chance = 0
    
    private func calculateSingles(_ value: Int) -> Int {
        let diceValueArray = [diceOneValue, diceTwoValue, diceThreeValue, diceFourValue, diceFiveValue]
        var count = 0
        
        //I returned an error when changing 'dice' to $0. Can we look at this?
        diceValueArray.forEach { dice in
            if dice == value{
                count += dice
            }
        }
        
        return count
    }
    
    func ones() -> Int{
        calculateSingles(1)
    }
    
    func twos() -> Int{
        calculateSingles(2)
    }
    
    func threes() -> Int{
        calculateSingles(3)
    }

    func fours() -> Int{
        calculateSingles(4)
    }
    
    func fives() -> Int{
        calculateSingles(5)
    }
    
    func sixes() -> Int{
        calculateSingles(6)
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
    
    func resetScoresDuringGame(B1: UIButton, S1: UILabel, B2: UIButton, S2: UILabel, B3: UIButton, S3: UILabel, B4: UIButton, S4: UILabel, B5: UIButton, S5: UILabel, B6: UIButton, S6: UILabel, B7: UIButton, S7: UILabel, B8: UIButton, S8: UILabel, B9: UIButton, S9: UILabel, B10: UIButton, S10: UILabel, B11: UIButton, S11: UILabel, B12: UIButton, S12: UILabel, B13: UIButton, S13: UILabel){
        if B1.backgroundColor != UIColor.green{
            S1.text = String(0)
        }
        if B2.backgroundColor != UIColor.green{
            S2.text = String(0)
        }
        if B3.backgroundColor != UIColor.green{
            S3.text = String(0)
        }
        if B4.backgroundColor != UIColor.green{
            S4.text = String(0)
        }
        if B5.backgroundColor != UIColor.green{
            S5.text = String(0)
        }
        if B6.backgroundColor != UIColor.green{
            S6.text = String(0)
        }
        if B7.backgroundColor != UIColor.green{
            S7.text = String(0)
        }
        if B8.backgroundColor != UIColor.green{
            S8.text = String(0)
        }
        if B9.backgroundColor != UIColor.green{
            S9.text = String(0)
        }
        if B10.backgroundColor != UIColor.green{
            S10.text = String(0)
        }
        if B11.backgroundColor != UIColor.green{
            S11.text = String(0)
        }
        if B12.backgroundColor != UIColor.green{
            S12.text = String(0)
        }
        if B13.backgroundColor != UIColor.green{
            S13.text = String(0)
        }
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
    
    func gameIsComplete(S1: UIButton, S2: UIButton, S3: UIButton, S4: UIButton, S5: UIButton, S6: UIButton, S7: UIButton, S8: UIButton, S9: UIButton, S10: UIButton, S11: UIButton, S12: UIButton) -> Bool {
        if S1.backgroundColor == UIColor.green &&
            S2.backgroundColor == UIColor.green &&
            S3.backgroundColor == UIColor.green &&
            S4.backgroundColor == UIColor.green &&
            S5.backgroundColor == UIColor.green &&
            S6.backgroundColor == UIColor.green &&
            S7.backgroundColor == UIColor.green &&
            S8.backgroundColor == UIColor.green &&
            S9.backgroundColor == UIColor.green &&
            S10.backgroundColor == UIColor.green &&
            S11.backgroundColor == UIColor.green &&
            S12.backgroundColor == UIColor.green {
            return true
        } else {
            return false
        }
    }
    
    func resetScoreBackgrounds(S1: UIButton, S2: UIButton, S3: UIButton, S4: UIButton, S5: UIButton, S6: UIButton, S7: UIButton, S8: UIButton, S9: UIButton, S10: UIButton, S11: UIButton, S12: UIButton, S13: UIButton){
        S1.backgroundColor = UIColor.clear
        S2.backgroundColor = UIColor.clear
        S3.backgroundColor = UIColor.clear
        S4.backgroundColor = UIColor.clear
        S5.backgroundColor = UIColor.clear
        S6.backgroundColor = UIColor.clear
        S7.backgroundColor = UIColor.clear
        S8.backgroundColor = UIColor.clear
        S9.backgroundColor = UIColor.clear
        S10.backgroundColor = UIColor.clear
        S11.backgroundColor = UIColor.clear
        S12.backgroundColor = UIColor.clear
        S13.backgroundColor = UIColor.clear
    }
    
    func resetScores(S1: UILabel, S2: UILabel, S3: UILabel, S4: UILabel, S5: UILabel, S6: UILabel, S7: UILabel, S8: UILabel, S9: UILabel, S10: UILabel, S11: UILabel, S12: UILabel, S13: UILabel){
        S1.text = String(0)
        S2.text = String(0)
        S3.text = String(0)
        S4.text = String(0)
        S5.text = String(0)
        S6.text = String(0)
        S7.text = String(0)
        S8.text = String(0)
        S9.text = String(0)
        S10.text = String(0)
        S11.text = String(0)
        S12.text = String(0)
        S13.text = String(0)
    }
}
