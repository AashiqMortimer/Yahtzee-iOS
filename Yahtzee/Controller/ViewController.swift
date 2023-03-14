//
//  ViewController.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 27/10/2022.
//

import UIKit

class ViewController2: UIViewController {
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.gameBrain.dice)
        view.backgroundColor = UIColor.red
        let label = UILabel()
        label.frame = CGRectMake(0, 50, view.bounds.width, 50)
        label.text = viewModel.title
        label.textAlignment = .center
        view.addSubview(label)
        let oneOfAKindTitle = UILabel()
        oneOfAKindTitle.frame = CGRectMake(0, label.frame.maxY + 50, view.bounds.width, 50)
        oneOfAKindTitle.textAlignment = .center
        oneOfAKindTitle.text = viewModel.oneOfAKindTitle
        view.addSubview(oneOfAKindTitle)
        let oneOfAKindValue = UILabel()
        oneOfAKindValue.frame = CGRectMake(0, oneOfAKindTitle.frame.maxY + 50, view.bounds.width, 50)
        oneOfAKindValue.textAlignment = .center
        oneOfAKindValue.text = viewModel.oneOfAKindValue
        view.addSubview(oneOfAKindValue)
        let twoOfAKindTitle = UILabel()
        twoOfAKindTitle.frame = CGRectMake(0, label.frame.maxY + 100, view.bounds.width, 50)
        twoOfAKindTitle.textAlignment = .center
        twoOfAKindTitle.text = viewModel.twoOfAKindTitle
        view.addSubview(twoOfAKindTitle)
        let twoOfAKindValue = UILabel()
        twoOfAKindValue.frame = CGRectMake(0, twoOfAKindTitle.frame.maxY + 50, view.bounds.width, 50)
        twoOfAKindValue.textAlignment = .center
        twoOfAKindValue.text = viewModel.twoOfAKindValue
        view.addSubview(twoOfAKindValue)
        
        //Attempt at creating UIButton to roll dice
        let rollButton = UIButton()
        rollButton.frame = CGRectMake(0, label.frame.maxY + 100, 150, 50)
        rollButton.setTitle("Roll", for: .normal)
        rollButton.setTitleColor(.black, for: .normal)
        rollButton.backgroundColor = .white
        
        //This is the action for when the button is tapped. I have made a call to the ViewModel within a closure here.
        rollButton.addAction(UIAction(handler: { _ in
            self.viewModel.rollDice()
            print(self.viewModel.gameBrain.dice)
        }), for: .touchUpInside)
        view.addSubview(rollButton)
        
        //Just for the sake of testing functionality, I have created a second button to make the call 'reset'
        let resetButton = UIButton()
        resetButton.frame = CGRectMake(0, rollButton.frame.maxY + 100, 150, 50)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.backgroundColor = .gray
        
        resetButton.addAction(UIAction(handler: { _ in
            print(self.viewModel.gameBrain.dice)
        }	), for: .touchUpInside)
        view.addSubview(resetButton)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var diceRollContainer: UIView!
    @IBOutlet weak var diceStart: UIView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var promptContainer: UIView!
    @IBOutlet weak var promptText: UILabel!
    @IBOutlet weak var gameRoundCounter: UILabel!
    
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
    
    //End Game UI fields
    @IBOutlet weak var endGameView: UIView!
    @IBOutlet weak var endGameTotalScore: UILabel!
    @IBOutlet weak var endGameQuestion: UILabel!
    @IBOutlet weak var endGameYes: UIButton!
    @IBOutlet weak var endGameNo: UIButton!
    
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
        
        promptContainer.layer.cornerRadius = 12;
        
        endGameView.layer.cornerRadius = 22;
        endGameView.isHidden = true;
        
        //Hide dice within open container when first load.
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
    }

    @IBAction func rollButton(_ sender: Any) {
        //update counter to control logic
        if gameBrain.moveCount == 2 {
            rollButton.isUserInteractionEnabled = false
        }
        
        gameBrain.moveCount += 1
        
        promptText.text = "Rolls: \(gameBrain.moveArray[gameBrain.moveCount] ?? 999)"
        
        //Push dice into dice roll container and randomise
        
        if diceOne.isHidden || gameBrain.moveCount == 1 {
            diceOne.image = gameBrain.diceArray.randomElement()
        }
        if diceTwo.isHidden || gameBrain.moveCount == 1 {
            diceTwo.image = gameBrain.diceArray.randomElement()
        }
        if diceThree.isHidden || gameBrain.moveCount == 1 {
            diceThree.image = gameBrain.diceArray.randomElement()
        }
        if diceFour.isHidden || gameBrain.moveCount == 1 {
            diceFour.image = gameBrain.diceArray.randomElement()
        }
        if diceFive.isHidden || gameBrain.moveCount == 1 {
            diceFive.image = gameBrain.diceArray.randomElement()
        }
        
        gameBrain.updateValue(diceOne.image!, diceTwo.image!, diceThree.image!, diceFour.image!, diceFive.image!)
        
        diceOneOpen.image = diceOne.image
        diceTwoOpen.image = diceTwo.image
        diceThreeOpen.image = diceThree.image
        diceFourOpen.image = diceFour.image
        diceFiveOpen.image = diceFive.image
        
        //On first roll, only display dice in open container and not in hold. Before first roll, only display dice in hold.
        if gameBrain.moveCount == 1 {
            gameBrain.hideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
            gameBrain.unhideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        }
        
        //Only randomise dice within dice roll container
    
        //Refresh scores
        //Update so that when user selects a score, it stores that number so only numbers that have not been selected are refreshed to zero. Re-enable score selection after disabling in button function.
        if oneScoreButton.backgroundColor != UIColor.green{
            onesScore.text = String(gameBrain.ones())
            oneScoreButton.isEnabled = true
        }
        
        if twoScoreButton.backgroundColor != UIColor.green{
            twosScore.text = String(gameBrain.twos())
            twoScoreButton.isEnabled = true
        }
        
        if threeScoreButton.backgroundColor != UIColor.green{
            threesScore.text = String(gameBrain.threes())
            threeScoreButton.isEnabled = true
        }
        
        if fourScoreButton.backgroundColor != UIColor.green{
            foursScore.text = String(gameBrain.fours())
            fourScoreButton.isEnabled = true
        }
        
        if fiveScoreButton.backgroundColor != UIColor.green{
            fivesScore.text = String(gameBrain.fives())
            fiveScoreButton.isEnabled = true
        }
        
        if sixScoreButton.backgroundColor != UIColor.green{
            sixesScore.text = String(gameBrain.sixes())
            sixScoreButton.isEnabled = true
        }
        
        if threeOfAKindScoreButton.backgroundColor != UIColor.green{
            gameBrain.threeOfAKind = 0
            gameBrain.calculateThreeOfAKind()
            threeOfAKindScore.text = String(gameBrain.threeOfAKind)
            threeOfAKindScoreButton.isEnabled = true
        }
        
        if fourOfAKindScoreButton.backgroundColor != UIColor.green{
            gameBrain.fourOfAKind = 0
            gameBrain.calculateFourOfAKind()
            fourOfAKindScore.text = String(gameBrain.fourOfAKind)
            fourOfAKindScoreButton.isEnabled = true
        }
        
        if fullHouseScoreButton.backgroundColor != UIColor.green{
            gameBrain.fullHouse = 0
            gameBrain.calculateFullHouse()
            fullHouseScore.text = String(gameBrain.fullHouse)
            fullHouseScoreButton.isEnabled = true
        }
        
        if smallStraightScoreButton.backgroundColor != UIColor.green{
            gameBrain.smallStraight = 0
            gameBrain.calculateSmallStraight()
            smallStraightScore.text = String(gameBrain.smallStraight)
            smallStraightScoreButton.isEnabled = true
        }
        
        if largeStraightScoreButton.backgroundColor != UIColor.green{
            gameBrain.largeStraight = 0
            gameBrain.calculateLargeStraight()
            largeStraightScore.text = String(gameBrain.largeStraight)
            largeStraightScoreButton.isEnabled = true
        }
        
        if chanceScoreButton.backgroundColor != UIColor.green{
            gameBrain.chance = 0
            gameBrain.calculateChance()
            chanceScore.text = String(gameBrain.chance)
            chanceScoreButton.isEnabled = true
        }
        
        if yahtzeeScoreButton.backgroundColor != UIColor.green{
            gameBrain.yahtzee = 0
            gameBrain.calculateYahtzee()
            yahtzeeScore.text = String(gameBrain.yahtzee)
            yahtzeeScoreButton.isEnabled = true
        }
    }
    
    @IBAction func oneScoreButton(_ sender: Any) {
        oneScoreButton.backgroundColor = UIColor.green
        //Q: Instead of making multiple calls of this function, would it be better to call it once in ViewController via a variable and then use the var here to update the savedScore?
        gameBrain.savedScore += gameBrain.ones()
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: twoScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func twoScoreButton(_ sender: UIButton) {
        twoScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.twos()
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func threeScoreButton(_ sender: UIButton) {
        threeScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.threes()
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: twoScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func fourScoreButton(_ sender: UIButton) {
        fourScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fours()
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: twoScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func fiveScoreButton(_ sender: UIButton) {
        fiveScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fives()
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: twoScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func sixScoreButton(_ sender: UIButton) {
        sixScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.sixes()
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: twoScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func threeOfAKindScoreButton(_ sender: Any) {
        threeOfAKindScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.threeOfAKind
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: twoScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func fourOfAKindScoreButton(_ sender: UIButton) {
        fourOfAKindScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fourOfAKind
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: twoScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func fullHouseScoreButton(_ sender: UIButton) {
        fullHouseScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.fullHouse
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: twoScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func smallStraightScoreButton(_ sender: UIButton) {
        smallStraightScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.smallStraight
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: twoScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func largeStraightScoreButton(_ sender: UIButton) {
        largeStraightScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.largeStraight
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: twoScoreButton, S11: chanceScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func chanceScoreButton(_ sender: UIButton) {
        chanceScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.chance
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: twoScoreButton, S12: yahtzeeScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    @IBAction func yahtzeeScoreButton(_ sender: UIButton) {
        yahtzeeScoreButton.backgroundColor = UIColor.green
        gameBrain.savedScore += gameBrain.yahtzee
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.moveCount = 0
        gameBrain.roundCount += 1
        rollButton.isUserInteractionEnabled = true
        gameBrain.hideSet(d1: diceOneOpen, d2: diceTwoOpen, d3: diceThreeOpen, d4: diceFourOpen, d5: diceFiveOpen)
        gameBrain.unhideSet(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        gameBrain.resetDiceImages(d1: diceOne, d2: diceTwo, d3: diceThree, d4: diceFour, d5: diceFive)
        promptText.text = "Rolls: 3"
        gameBrain.resetScoresDuringGame(B1: oneScoreButton, S1: onesScore, B2: twoScoreButton, S2: twosScore, B3: threeScoreButton, S3: threesScore, B4: fourScoreButton, S4: foursScore, B5: fiveScoreButton, S5: fivesScore, B6: sixScoreButton, S6: sixesScore, B7: fullHouseScoreButton, S7: fullHouseScore, B8: threeOfAKindScoreButton, S8: threeOfAKindScore, B9: fourOfAKindScoreButton, S9: fourOfAKindScore, B10: smallStraightScoreButton, S10: smallStraightScore, B11: largeStraightScoreButton, S11: largeStraightScore, B12: chanceScoreButton, S12: chanceScore, B13: yahtzeeScoreButton, S13: yahtzeeScore)
        gameRoundCounter.text = "ROUND \(String(gameBrain.roundCount)) OF 13"
        //Below logic to prevent user from selecting multiple scores in one round. isHidden value re-enabled when roll button tapped.
        gameBrain.disableScores(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        //Check if game is completed:
        if gameBrain.gameIsComplete(S1: oneScoreButton, S2: threeScoreButton, S3: fourScoreButton, S4: fiveScoreButton, S5: sixScoreButton, S6: threeOfAKindScoreButton, S7: fourOfAKindScoreButton, S8: fullHouseScoreButton, S9: smallStraightScoreButton, S10: largeStraightScoreButton, S11: chanceScoreButton, S12: twoScoreButton){
            endGameView.isHidden = false
            endGameTotalScore.text = String(gameBrain.savedScore)
        }
    }
    
    //Dice movement code. Tap gesture recognizers.
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
    
    @IBAction func endGameYes(_ sender: UIButton) {
        //Hide end game view, restart total score, change score label background colour back to normal
        endGameView.isHidden = true
        gameBrain.savedScore = 0
        totalScore.text = String(gameBrain.savedScore)
        gameBrain.resetScoreBackgrounds(S1: oneScoreButton, S2: twoScoreButton, S3: threeScoreButton, S4: fourScoreButton, S5: fiveScoreButton, S6: sixScoreButton, S7: threeOfAKindScoreButton, S8: fourOfAKindScoreButton, S9: fullHouseScoreButton, S10: smallStraightScoreButton, S11: largeStraightScoreButton, S12: chanceScoreButton, S13: yahtzeeScoreButton)
        gameBrain.resetScores(S1: onesScore, S2: twosScore, S3: threesScore, S4: foursScore, S5: fivesScore, S6: sixesScore, S7: threeOfAKindScore, S8: fourOfAKindScore, S9: fullHouseScore, S10: smallStraightScore, S11: largeStraightScore, S12: chanceScore, S13: yahtzeeScore)
    }
    
    @IBAction func endGameNo(_ sender: UIButton) {
        //Change prompt text to 'Thank you for playing!' and remove the buttons.
        endGameQuestion.text = "Thank you for playing!"
        endGameYes.isHidden = true
        endGameNo.isHidden = true
    }
}
