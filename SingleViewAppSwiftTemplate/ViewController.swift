//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

private let reuseIdentifier = "buttonStatement"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: Declarations
    // Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    var currentSelection: String = ""
    var playerArray: [StatementSetUp] = []
    var statementButtonsArray: [UIButton?] = []
    
    var player1: StatementSetUp? = nil
    var player2: StatementSetUp? = nil
    var player3: StatementSetUp? = nil
    var player4: StatementSetUp? = nil

    var statement1: UIButton? = nil
    var statement2: UIButton? = nil
    var statement3: UIButton? = nil
    var statement4: UIButton? = nil

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
        createStatementToLabel()
        // Clear random array
        statements.randomStatementArray.removeAll()
        labelNextRound.text = "Shake to complete"
        // Set default backround image
        nextRound.setBackgroundImage(nil, for: UIControlState.normal)
        // Unable statement buttons
        statementButtonsIsEnabledFalse()
        setupCollectionViewCells()
    }
    
    func countingRounds() {
        if countRounds < 6 {
            countRounds += 1
            setUpView()
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
        //statement1.layer.cornerRadius = 5
    }
    
    
    func statementButtonsIsEnabledFalse () {
        // Unable buttons
        
        for button in statementButtonsArray {
            button?.isEnabled = false
            button?.alpha = 1.0
        }
    }
    
    func statementButtonsIsEnabledTrue () {
        // Unable buttons
        
        for button in statementButtonsArray {
            button?.isEnabled = true
        }
    }
    
    
    
    func buttonsIsEnabledFalse () {
        // Unable buttons
        let arrowButtonsArray = [arrowUpStatement2, arrowUpStatement3, arrowUpStatement4, arrowDownStatement1, arrowDownStatement2, arrowDownStatement3]
        
        for button in arrowButtonsArray {
            button?.isEnabled = false
            button?.alpha = 1.0
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
        
        // Sort randomArray
        statements.sortPointsOfRandomStatementArray()
        
        print("randomArray: \(statements.randomStatementArray)")
        print("statementsArrayCount: \(statements.statementsArray.count)")
        print("playerArray: \(playerArray)")
        print(player1?.player ?? "Missing value")
        print(player2?.player ?? "Missing value")
        print(player3?.player ?? "Missing value")
        print(player4?.player ?? "Missing value")
        print(player1?.statement ?? "Missing value")
        
    }
    
    
    func createStatementToLabel() {
        
        statementButtonsArray.append(statement1)
        statementButtonsArray.append(statement2)
        statementButtonsArray.append(statement3)
        statementButtonsArray.append(statement4)
        
        statement1?.setTitle(player1?.statement, for: UIControlState.normal)
        statement2?.setTitle(player2?.statement, for: UIControlState.normal)
        statement3?.setTitle(player3?.statement, for: UIControlState.normal)
        statement4?.setTitle(player4?.statement, for: UIControlState.normal)

        
        print("Statements:")
        print(statement1?.title(for: UIControlState.normal) ?? "Missing value")
        print(statement2?.title(for: UIControlState.normal) ?? "Missing value")
        print(statement3?.title(for: UIControlState.normal) ?? "Missing value")
        print(statement4?.title(for: UIControlState.normal) ?? "Missing value")
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
    
    func checkPoints() {
        let array = statements.randomStatementArray
        
        if player1?.points == statements.randomStatementArray[0].points && player2?.points == statements.randomStatementArray[1].points && player3?.points == statements.randomStatementArray[2].points && player4?.points == statements.randomStatementArray[3].points {
            checkedPoints = true
        } else {
            checkedPoints = false
        }
        
        print("Points:")
        print("\(player1?.points)")
        print("\(array[0].points)")
        
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
        
        // Statement buttons can be pressed
        statementButtonsIsEnabledTrue()
        
        // Must invalidate timer before starting a new round, otherwise it becomes a new timer all the time
        timer.invalidate()
        nextRound.setTitle("", for: UIControlState.normal)
    }
    
    

    
    // MARK: - Actions
    
    @IBAction func arrowButtonPressed(_ sender: UIButton) {
        switch sender {
            case arrowDownStatement1:
                let currentText = player1?.statement
                let belowText = player2?.statement
                statement1?.setTitle(currentText, for: UIControlState.normal)
                statement2?.setTitle(belowText, for: UIControlState.normal)
                
                let currentPlayer = player1
                let belowPlayer = player2
                player1 = belowPlayer
                player2 = currentPlayer
            
            case arrowDownStatement2:
                let currentText = player2?.statement
                let belowText = player3?.statement
                statement2?.setTitle(currentText, for: UIControlState.normal)
                statement3?.setTitle(belowText, for: UIControlState.normal)
                
                let currentPlayer = player2
                let belowPlayer = player3
                player2 = belowPlayer
                player3 = currentPlayer
            
            case arrowDownStatement3:
                let currentText = player3?.statement
                let belowText = player4?.statement
                statement3?.setTitle(currentText, for: UIControlState.normal)
                statement4?.setTitle(belowText, for: UIControlState.normal)
                
                let currentPlayer = player3
                let belowPlayer = player4
                player3 = belowPlayer
                player4 = currentPlayer
            
            case arrowUpStatement2:
                let currentText = player2?.statement
                let aboveText = player1?.statement
                statement2?.setTitle(currentText, for: UIControlState.normal)
                statement1?.setTitle(aboveText, for: UIControlState.normal)
                
                let currentPlayer = player2
                let abovePlayer = player1
                player2 = abovePlayer
                player1 = currentPlayer
            
            case arrowUpStatement3:
                let currentText = player3?.statement
                let aboveText = player2?.statement
                statement3?.setTitle(currentText, for: UIControlState.normal)
                statement2?.setTitle(aboveText, for: UIControlState.normal)
                
                let currentPlayer = player3
                let abovePlayer = player2
                player3 = abovePlayer
                player2 = currentPlayer
            
            case arrowUpStatement4:
                let currentText = player4?.statement
                let aboveText = player3?.statement
                statement4?.setTitle(currentText, for: UIControlState.normal)
                statement3?.setTitle(aboveText, for: UIControlState.normal)
                
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
        //checkPoints()
        print("RanndomArrayCheck")
        print(statements.randomStatementArray)
        countingRounds()
    
    }
    
    // MARK: - UICollectionView
    
    func setupCollectionViewCells() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        let padding: CGFloat = 10
        layout.itemSize = CGSize(width: 316 - padding, height: 100 - padding)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        collectionView.collectionViewLayout = layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! buttonCollectionView
        
        // find corrects button to shows
        let item = statementButtonsArray[indexPath.row]

        cell.buttonView = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: true)
        // current selection
        currentSelection = playerArray[indexPath.row].statement
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        updateCellBackgroundColor(indexPath, selected: false)
    }
    
    func updateCellBackgroundColor(_ indexPath: IndexPath, selected: Bool) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = selected ? UIColor(red: 41/255.0, green: 211/255.0, blue: 241/255.0, alpha: 1.0) : UIColor.clear
        }
    }

    
    
}

