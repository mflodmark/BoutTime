//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var statement1: UILabel!
    @IBOutlet weak var statement2: UILabel!
    @IBOutlet weak var statement3: UILabel!
    @IBOutlet weak var statement4: UILabel!
    
    @IBOutlet weak var arrowDownStatement1: UIButton!
    @IBOutlet weak var arrowDownStatement2: UIButton!
    @IBOutlet weak var arrowDownStatement3: UIButton!
    @IBOutlet weak var arrowUpStatement3: UIButton!
    @IBOutlet weak var arrowUpStatement4: UIButton!
    @IBOutlet weak var arrowUpStatement2: UIButton!
 
    @IBOutlet weak var nextRound: UIButton!
    @IBOutlet weak var labelNextRound: UILabel!
    
    // Declarations
    var imageButtonSelected: UIImage? = nil
    var imageButtonNonSelected: UIImage? = nil
    let statements = Statements()
    var timer = Timer()
    
    var checkedPoints: Bool = false
    var countRounds: Int = 0
    var pointsPerRound: Int = 0
    
    var timeRemaining: Int = 60
    var points1: Int = 0
    var points2: Int = 0
    var points3: Int = 0
    var points4: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Functions
    
    func setUpView() {
        roundedCorners()
        addStatementToLabels()
        timerStart()
        buttonsIsEnabledTrue()
        countingRounds()
        // Clear random array
        statements.randomStatementArray.removeAll()
    }
    
    func countingRounds() {
        if countRounds < 6 {
            countRounds += 1
        } else {
            // show score and let the player decide if starting new play
            let viewPlayAgain = ViewPlayAgain()
            viewPlayAgain.showScore(points: pointsPerRound, rounds: countRounds)
            // restart counter of points
            pointsPerRound = 0
        }
    }
    
    func roundedCorners() {
        statement1.layer.cornerRadius = 5
    }
    
    
    func buttonsIsEnabledFalse () {
        // Unable buttons
        let arrowButtonsArray = [arrowUpStatement2, arrowUpStatement3, arrowUpStatement4, arrowDownStatement1, arrowDownStatement2, arrowDownStatement3]
        
        for button in arrowButtonsArray {
            button?.isEnabled = false
        }
    }
    
    func buttonsIsEnabledTrue () {
        // Enable buttons
        let arrowButtonsArray = [arrowUpStatement2, arrowUpStatement3, arrowUpStatement4, arrowDownStatement1, arrowDownStatement2, arrowDownStatement3]
        
        for button in arrowButtonsArray {
            button?.isEnabled = true
        }
    }
    
    func timerStart() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountdown), userInfo: nil, repeats: true)
        
        // Starting time
        timeRemaining = 60
    }
    
    func timerCountdown() {
        // update label on UI
        nextRound.setTitle("0:\(timeRemaining)", for: UIControlState.normal)
        
        // Stop timer & go to next question if 0
        if timeRemaining == 0 {
            // Must invalidate timer before starting a new round, otherwise it becomes a new timer all the time
            timer.invalidate()
            nextRound.setTitle("", for: UIControlState.normal)
            
            // Replace timer with image depending on correct answer or not
            checkLabelToPoints()
            
        } else {
            timeRemaining -= 1
        }
    }
    

    
    func addStatementToLabels() {
        // Arrays
        let labelsArray = [statement1, statement2, statement3, statement4]

        for label in labelsArray {
            // Add random statement to labels
            let indexOfSelectedStatement = Statements().randomStatement()
            let randomStatement = statements.statementsArray[indexOfSelectedStatement]
            let statementText = "Player: \(randomStatement.player.rawValue) \nType: \(randomStatement.pointType) \nSeason: \(randomStatement.season.rawValue)"
            
            label?.text = statementText
            
            // Add statement to random statement array
            statements.randomStatementArray.append(randomStatement)
            
            // Add points to "label"
            //switch label {
                //case statement1: points1 = randomStatement.points
                //case statement2: points2 = randomStatement.points
                //case statement3: points2 = randomStatement.points
                //case statement4: points2 = randomStatement.points
            //}
            
            // Remove statement from original array
            //statements.statementsArray.remove(at: indexOfSelectedStatement)
            
        }
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            checkLabelToPoints()
            
        }
    }

    
    func showSelectedArrow(button: UIButton, imageSelected: UIImage, imageNonSelected: UIImage) {


    }
    
    func showNonSelectedArrow(button: UIButton, imageNonSelected: UIImage) {
        arrowDownStatement1.setBackgroundImage(imageNonSelected, for: UIControlState.normal)
    }
    
    func checkPoints() -> Bool {
        let array = statements.randomStatementArray
        
        if points1 == array[0].points && points2 == array[1].points && points3 == array[2].points && points4 == array[3].points {
            checkedPoints = true
        } else {
            checkedPoints = false
        }

        return checkedPoints

    }
    
    func checkLabelToPoints() {
        if checkedPoints == true {
            nextRound.setBackgroundImage(#imageLiteral(resourceName: "next_round_success"), for: UIControlState.normal)
            pointsPerRound += 1
        } else {
            nextRound.setBackgroundImage(#imageLiteral(resourceName: "next_round_fail"), for: UIControlState.normal)
        }
        // Buttons can't be pressed
        buttonsIsEnabledFalse()
    }
    

    
    // MARK: - Actions
    
    @IBAction func arrowButtonPressed(_ sender: UIButton) {
        switch sender {
            case arrowDownStatement1:
                let currentText = statement1.text
                let belowText = statement2.text
                statement1.text = belowText
                statement2.text = currentText
            
            case arrowDownStatement2:
                let currentText = statement2.text
                let belowText = statement3.text
                statement2.text = belowText
                statement3.text = currentText
            
            case arrowDownStatement3:
                let currentText = statement3.text
                let belowText = statement4.text
                statement3.text = belowText
                statement4.text = currentText
            
            case arrowUpStatement2:
                let currentText = statement2.text
                let aboveText = statement1.text
                statement2.text = aboveText
                statement1.text = currentText
            
            case arrowUpStatement3:
                let currentText = statement3.text
                let aboveText = statement2.text
                statement3.text = aboveText
                statement2.text = currentText
            
            case arrowUpStatement4:
                let currentText = statement4.text
                let aboveText = statement3.text
                statement4.text = aboveText
                statement3.text = currentText
            
            default:
                print("Something went wrong!")
        }
    }
    
    @IBAction func nextRoundAction(_ sender: UIButton) {
        // check rounds
        countingRounds()
    
    }
    
    
}

