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
    let viewPlayAgain = ViewPlayAgain()
    var timer = Timer()
    
    var checkedPoints: Bool = false
    var countRounds: Int = 0
    var pointsPerRound: Int = 0
    
    var timeRemaining: Int = 60
    
    var playerStatement: String = ""
    var playerArray: [StatementSetUp] = []
    var player1: StatementSetUp? = nil
    var player2: StatementSetUp? = nil
    var player3: StatementSetUp? = nil
    var player4: StatementSetUp? = nil


    
    
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
        randomStatements()
        timerStart()
        buttonsIsEnabledTrue()
        countingRounds()
        createStatementToLabel()
        // Clear random array
        statements.randomStatementArray.removeAll()
        labelNextRound.text = "Shake to complete"
    }
    
    func countingRounds() {
        if countRounds < 6 {
            countRounds += 1
        } else {
            // show score and let the player decide if starting new play
            viewPlayAgain.showScore(points: pointsPerRound, rounds: countRounds)

            // restart counter of points
            pointsPerRound = 0
            performSegue(withIdentifier: "playAgainSegue" , sender: nextRound)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "playAgainSegue" {
            //segue.destination
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
            
            // Replace timer with image depending on correct answer or not
            checkLabelToPoints()
            
        } else {
            timeRemaining -= 1
        }
    }
    

    
    func randomStatements() {
        for _ in 1...4 {
            // Add random statement to labels
            let indexOfSelectedStatement = Statements().randomStatement()
            let randomStatement = statements.statementsArray[indexOfSelectedStatement]


            // Add statement to arrays
            statements.randomStatementArray.append(randomStatement)
            playerArray.append(randomStatement)

            // Remove statement from original array
            //statements.statementsArray.remove(at: indexOfSelectedStatement)
        }
        
        player1 = playerArray[0]
        player2 = playerArray[1]
        player3 = playerArray[2]
        player4 = playerArray[3]
        
        print("randomArray: \(statements.randomStatementArray)")
        print("statementsArrayCount: \(statements.statementsArray.count)")
        print("playerArray: \(playerArray)")
        print(player1?.player)
        print(player2?.player)
        print(player3?.player)
        print(player4?.player)
        
    }
    
    
    func createStatementToLabel() {
        for player in playerArray {
            let statementText = "Player: \(player.player.rawValue) \nType: \(player.pointType) \nSeason: \(player.season.rawValue)"
            switch player.player {
                //FIXME: unwrapping
                case (player1?.player)!: statement1.text = statementText
                case (player2?.player)!: statement2.text = statementText
                case (player3?.player)!: statement3.text = statementText
                case (player4?.player)!: statement4.text = statementText
            default: "Something went wrong!"
            }
        }
        print("Statements:")
        print(statement1.text)
        print(statement2.text)
        print(statement3.text)
        print(statement4.text)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            checkLabelToPoints()
        }
    }

    // TA BORT?
    func showSelectedArrow(button: UIButton, imageSelected: UIImage, imageNonSelected: UIImage) {


    }
    
    func showNonSelectedArrow(button: UIButton, imageNonSelected: UIImage) {
        arrowDownStatement1.setBackgroundImage(imageNonSelected, for: UIControlState.normal)
    }
    
    func checkPoints() -> Bool {
        let array = statements.randomStatementArray
        
        if player1?.points == array[0].points && player2?.points == array[1].points && player3?.points == array[2].points && player4?.points == array[3].points {
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
        labelNextRound.text = "Tap events to learn more"
        
        // Must invalidate timer before starting a new round, otherwise it becomes a new timer all the time
        timer.invalidate()
        nextRound.setTitle("", for: UIControlState.normal)
    }
    

    
    // MARK: - Actions
    
    @IBAction func arrowButtonPressed(_ sender: UIButton) {
        switch sender {
            case arrowDownStatement1:
                let currentText = statement1.text
                let belowText = statement2.text
                statement1.text = belowText
                statement2.text = currentText
                let currentPlayer = player1
                let belowPlayer = player2
                player1 = belowPlayer
                player2 = currentPlayer
            
            case arrowDownStatement2:
                let currentText = statement2.text
                let belowText = statement3.text
                statement2.text = belowText
                statement3.text = currentText
                let currentPlayer = player2
                let belowPlayer = player3
                player2 = belowPlayer
                player3 = currentPlayer
            
            case arrowDownStatement3:
                let currentText = statement3.text
                let belowText = statement4.text
                statement3.text = belowText
                statement4.text = currentText
                let currentPlayer = player3
                let belowPlayer = player4
                player3 = belowPlayer
                player4 = currentPlayer
            
            case arrowUpStatement2:
                let currentText = statement2.text
                let aboveText = statement1.text
                statement2.text = aboveText
                statement1.text = currentText
                let currentPlayer = player2
                let abovePlayer = player1
                player2 = abovePlayer
                player1 = currentPlayer
            
            case arrowUpStatement3:
                let currentText = statement3.text
                let aboveText = statement2.text
                statement3.text = aboveText
                statement2.text = currentText
                let currentPlayer = player3
                let abovePlayer = player2
                player3 = abovePlayer
                player2 = currentPlayer
            
            case arrowUpStatement4:
                let currentText = statement4.text
                let aboveText = statement3.text
                statement4.text = aboveText
                statement3.text = currentText
                let currentPlayer = player4
                let abovePlayer = player3
                player4 = abovePlayer
                player3 = currentPlayer
            
            default:
                print("Something went wrong!")
        }
    }
    
    @IBAction func nextRoundAction(_ sender: UIButton) {
        // check rounds
        countingRounds()
    
    }
    
    
}

