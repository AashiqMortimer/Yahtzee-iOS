//
//  ViewController.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 27/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceRollContainer: UIView!
    @IBOutlet weak var diceStart: UIView!
    
    @IBOutlet weak var onesScore: UILabel!
    @IBOutlet weak var twosScore: UILabel!
    @IBOutlet weak var threesScore: UILabel!
    @IBOutlet weak var foursScore: UILabel!
    @IBOutlet weak var fivesScore: UILabel!
    @IBOutlet weak var sixesScore: UILabel!
    @IBOutlet weak var threeOfAKindScore: UILabel!
    @IBOutlet weak var fourOfAKindScore: UILabel!
    @IBOutlet weak var fullHouseScore: UILabel!
    @IBOutlet weak var smallStraightScore: UILabel!
    @IBOutlet weak var largeStraightScore: UILabel!
    @IBOutlet weak var chanceScore: UILabel!
    @IBOutlet weak var yahtzeeScore: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet weak var oneScoreButton: UIButton!
    @IBOutlet weak var twoScoreButton: UIButton!
    @IBOutlet weak var threeScoreButton: UIButton!
    @IBOutlet weak var fourScoreButton: UIButton!
    @IBOutlet weak var fiveScoreButton: UIButton!
    @IBOutlet weak var sixScoreButton: UIButton!
    @IBOutlet weak var threeOfAKindScoreButton: UIButton!
    @IBOutlet weak var fourOfAKindScoreButton: UIButton!
    @IBOutlet weak var fullHouseScoreButton: UIButton!
    @IBOutlet weak var smallStraightScoreButton: UIButton!
    @IBOutlet weak var largeStraightScoreButton: UIButton!
    @IBOutlet weak var chanceScoreButton: UIButton!
    @IBOutlet weak var yahtzeeScoreButton: UIButton!
    
    //Create an array of all the dice images so that each dice can randomly roll to one of the images
    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    @IBOutlet weak var diceThree: UIImageView!
    @IBOutlet weak var diceFour: UIImageView!
    @IBOutlet weak var diceFive: UIImageView!
    @IBOutlet weak var diceOneOpen: UIImageView!
    @IBOutlet weak var diceTwoOpen: UIImageView!
    @IBOutlet weak var diceThreeOpen: UIImageView!
    @IBOutlet weak var diceFourOpen: UIImageView!
    @IBOutlet weak var diceFiveOpen: UIImageView!
    
    var gameBrain = GameBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceRollContainer.layer.cornerRadius = 22;
        diceRollContainer.layer.masksToBounds = true;
        diceRollContainer.layer.borderWidth = 2;
        diceRollContainer.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6, blue: 0.06274509804, alpha: 1);
        
        diceStart.layer.cornerRadius = 22;
        diceStart.layer.masksToBounds = true;
        diceStart.layer.borderWidth = 2;
        diceStart.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6, blue: 0.06274509804, alpha: 1);
        
        //Hide dice within open container when first load.
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
    }

    @IBAction func rollButton(_ sender: Any) {
        //update counter to control logic
        gameBrain.moveCount += 1
        print(diceOne.isHidden)
        
        //Push dice into dice roll container and randomise
        
        diceOne.image = gameBrain.diceArray.randomElement()
        diceTwo.image = gameBrain.diceArray.randomElement()
        diceThree.image = gameBrain.diceArray.randomElement()
        diceFour.image = gameBrain.diceArray.randomElement()
        diceFive.image = gameBrain.diceArray.randomElement()
        
        gameBrain.updateValue(diceOne.image!, diceTwo.image!, diceThree.image!, diceFour.image!, diceFive.image!)
        
        diceOneOpen.image = diceOne.image
        diceTwoOpen.image = diceTwo.image
        diceThreeOpen.image = diceThree.image
        diceFourOpen.image = diceFour.image
        diceFiveOpen.image = diceFive.image
        
        //On first roll, only display dice in open container and not in hold.
        if gameBrain.moveCount == 1 {
            gameBrain.hideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
            gameBrain.unhideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        }
        
        
        //Only randomise dice within dice roll container
    
        //Refresh scores.
        //Update so that when user selects a score, it stores that number so only numbers that have not been selected are refreshed to zero. Possible IF statement.
        if oneScoreButton.backgroundColor != UIColor.green{
            gameBrain.ones = 0
            gameBrain.calculateOnes()
            onesScore.text = String(gameBrain.ones)
        }
        
        if twoScoreButton.backgroundColor != UIColor.green{
            gameBrain.twos = 0
            gameBrain.calculateTwos()
            twosScore.text = String(gameBrain.twos)
        }
        
        if threeScoreButton.backgroundColor != UIColor.green{
            gameBrain.threes = 0
            gameBrain.calculateThrees()
            threesScore.text = String(gameBrain.threes)
        }
        
        if fourScoreButton.backgroundColor != UIColor.green{
            gameBrain.fours = 0
            gameBrain.calculateFours()
            foursScore.text = String(gameBrain.fours)
        }
        
        if fiveScoreButton.backgroundColor != UIColor.green{
            gameBrain.fives = 0
            gameBrain.calculateFives()
            fivesScore.text = String(gameBrain.fives)
        }
        
        if sixScoreButton.backgroundColor != UIColor.green{
            gameBrain.sixes = 0
            gameBrain.calculateSixes()
            sixesScore.text = String(gameBrain.sixes)
        }
        
        if threeOfAKindScoreButton.backgroundColor != UIColor.green{
            gameBrain.threeOfAKind = 0
            gameBrain.calculateThreeOfAKind()
            threeOfAKindScore.text = String(gameBrain.threeOfAKind)
        }
        
        if fourOfAKindScoreButton.backgroundColor != UIColor.green{
            gameBrain.fourOfAKind = 0
            gameBrain.calculateFourOfAKind()
            fourOfAKindScore.text = String(gameBrain.fourOfAKind)
        }
        
        if fullHouseScoreButton.backgroundColor != UIColor.green{
            gameBrain.fullHouse = 0
            gameBrain.calculateFullHouse()
            fullHouseScore.text = String(gameBrain.fullHouse)
        }
        
        if smallStraightScoreButton.backgroundColor != UIColor.green{
            gameBrain.smallStraight = 0
            gameBrain.calculateSmallStraight()
            smallStraightScore.text = String(gameBrain.smallStraight)
        }
        
        if largeStraightScoreButton.backgroundColor != UIColor.green{
            gameBrain.largeStraight = 0
            gameBrain.calculateLargeStraight()
            largeStraightScore.text = String(gameBrain.largeStraight)
        }
        
        if chanceScoreButton.backgroundColor != UIColor.green{
            gameBrain.chance = 0
            gameBrain.calculateChance()
            chanceScore.text = String(gameBrain.chance)
        }
        
        if yahtzeeScoreButton.backgroundColor != UIColor.green{
            gameBrain.yahtzee = 0
            gameBrain.calculateYahtzee()
            yahtzeeScore.text = String(gameBrain.yahtzee)
        }
        
        
    }
    
    
    @IBAction func oneScoreButton(_ sender: Any) {
        oneScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.ones
        totalScore.text = String(gameBrain.savedScore)
        oneScoreButton.isEnabled = false
    }
    
    @IBAction func twoScoreButton(_ sender: UIButton) {
        twoScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.twos
        totalScore.text = String(gameBrain.savedScore)
        twoScoreButton.isEnabled = false
    }
    
    @IBAction func threeScoreButton(_ sender: UIButton) {
        threeScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.threes
        totalScore.text = String(gameBrain.savedScore)
        threeScoreButton.isEnabled = false
    }
    
    @IBAction func fourScoreButton(_ sender: UIButton) {
        fourScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fours
        totalScore.text = String(gameBrain.savedScore)
        fourScoreButton.isEnabled = false
    }
    
    @IBAction func fiveScoreButton(_ sender: UIButton) {
        fiveScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fives
        totalScore.text = String(gameBrain.savedScore)
        fiveScoreButton.isEnabled = false
    }
    
    @IBAction func sixScoreButton(_ sender: UIButton) {
        sixScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.sixes
        totalScore.text = String(gameBrain.savedScore)
        sixScoreButton.isEnabled = false
    }
    
    @IBAction func threeOfAKindScoreButton(_ sender: Any) {
        threeOfAKindScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.threeOfAKind
        totalScore.text = String(gameBrain.savedScore)
        threeOfAKindScoreButton.isEnabled = false
    }
    
    @IBAction func fourOfAKindScoreButton(_ sender: UIButton) {
        fourOfAKindScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fourOfAKind
        totalScore.text = String(gameBrain.savedScore)
        fourOfAKindScoreButton.isEnabled = false
    }
    
    @IBAction func fullHouseScoreButton(_ sender: UIButton) {
        fullHouseScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fullHouse
        totalScore.text = String(gameBrain.savedScore)
        fullHouseScoreButton.isEnabled = false
    }
    
    @IBAction func smallStraightScoreButton(_ sender: UIButton) {
        smallStraightScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.smallStraight
        totalScore.text = String(gameBrain.savedScore)
        smallStraightScoreButton.isEnabled = false
    }
    
    @IBAction func largeStraightScoreButton(_ sender: UIButton) {
        largeStraightScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.largeStraight
        totalScore.text = String(gameBrain.savedScore)
        largeStraightScoreButton.isEnabled = false
    }
    
    @IBAction func chanceScoreButton(_ sender: UIButton) {
        chanceScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.chance
        totalScore.text = String(gameBrain.savedScore)
        chanceScoreButton.isEnabled = false
    }
    
    @IBAction func yahtzeeScoreButton(_ sender: UIButton) {
        yahtzeeScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.yahtzee
        totalScore.text = String(gameBrain.savedScore)
        yahtzeeScoreButton.isEnabled = false
    }
    
    //Dice movement code. Tap gesture recognizers.
    //Logic is currently underdeveloped; will need to adapt to sophisticated game move logic.
    @IBAction func tappedDiceOneOpen(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceOneOpen, dice2: diceOne)
        }
    }
    
    @IBAction func tappedDiceTwoOpen(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceTwoOpen, dice2: diceTwo)
        }
    }
    
    @IBAction func tappedDiceThreeOpen(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceThreeOpen, dice2: diceThree)
        }
    }
    
    @IBAction func tappedDiceFourOpen(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceFourOpen, dice2: diceFour)
        }
    }
    
    @IBAction func tappedDiceFiveOpen(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceFiveOpen, dice2: diceFive)
        }
    }
    
    @IBAction func tappedDiceOneClosed(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceOne, dice2: diceOneOpen)
        }
    }
    
    @IBAction func tappedDiceTwoClosed(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceTwo, dice2: diceTwoOpen)
        }
    }
    
    @IBAction func tappedDiceThreeClosed(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceThree, dice2: diceThreeOpen)
        }
    }
    
    @IBAction func tappedDiceFourClosed(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceFour, dice2: diceFourOpen)
        }
    }
    
    @IBAction func tappedDiceFiveClosed(_ sender: UITapGestureRecognizer) {
        if gameBrain.moveCount > 0 {
            gameBrain.hideAndDisplay(dice: diceFive, dice2: diceFiveOpen)
        }
    }
}

