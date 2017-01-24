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
    //var selectedStatement: String? = nil
    //var selectedStatementAbove: String? = nil
    //var selectedStatementBelow: String? = nil
    let statements = Statements()
    //let timer = TimerCountdown()
    var timer = Timer()
    var timeRemaining: Int = 60
    
    
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
    }
    
    func roundedCorners() {
        statement1.layer.cornerRadius = 5
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
            
            //nextRound() -- add function for next round
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
            
            // Remove statement from original array
            //statements.statementsArray.remove(at: indexOfSelectedStatement)
            
        }
        
    }

    
    func showSelectedArrow(button: UIButton, imageSelected: UIImage, imageNonSelected: UIImage) {
        
//        if button.isHighlighted == true {
//            button.setBackgroundImage(imageSelected, for: UIControlState.normal)
//        } else {
//            button.setBackgroundImage(imageNonSelected, for: UIControlState.normal)
//
//        }
        
        //button.setBackgroundImage(imageSelected, for: UIControlState.normal)
        
        // Take back first image with delay
        //loadWithDelay(seconds: 1, button: button, imageNonselected: imageNonSelected)

    }
    
    func showNonSelectedArrow(button: UIButton, imageNonSelected: UIImage) {
        arrowDownStatement1.setBackgroundImage(imageNonSelected, for: UIControlState.normal)
    }
    

    

    
    func loadWithDelay(seconds: Int, button: UIButton, imageNonselected: UIImage) {
        
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.showNonSelectedArrow(button: button, imageNonSelected: imageNonselected)
        }
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
}

