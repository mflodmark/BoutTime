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
    var selectedStatement: String? = nil
    var selectedStatementAbove: String? = nil
    var selectedStatementBelow: String? = nil
    let statements = Statements()
   
    
    
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
    }
    
    func roundedCorners() {
        statement1.layer.cornerRadius = 5
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
            statements.statementsArray.remove(at: indexOfSelectedStatement)
            
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
    
    func moveLabels(newStatement1: String?, newStatement2: String?, newStatement3: String?, newStatement4: String?) {
        statement1.text = newStatement1
        statement2.text = newStatement2
        statement3.text = newStatement3
        statement4.text = newStatement4

        
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
    
    @IBAction func arrowDownStatement1Action(_ sender: UIButton) {
        // setup buttons
        imageButtonSelected = #imageLiteral(resourceName: "down_full_selected")
        imageButtonNonSelected = #imageLiteral(resourceName: "down_full")
        
        // setup statements
        selectedStatementAbove = nil
        selectedStatement = statement1.text
        selectedStatementBelow = statement2.text
        
        // FIXME: fix unwrapping
        showSelectedArrow(button: sender, imageSelected: imageButtonSelected!, imageNonSelected: imageButtonNonSelected!)
        
        moveLabels(newStatement1: selectedStatementBelow, newStatement2: selectedStatement, newStatement3: statement3.text, newStatement4: statement4.text)
    }
    
    
    @IBAction func arrowUpStatement2Action(_ sender: UIButton) {
        // setup buttons
        imageButtonSelected = #imageLiteral(resourceName: "up_half_selected")
        imageButtonNonSelected = #imageLiteral(resourceName: "up_half")
        
        // setup statements
        selectedStatementAbove = statement1.text
        selectedStatement = statement2.text
        selectedStatementBelow = statement3.text
        
        // FIXME: fix unwrapping
        showSelectedArrow(button: sender, imageSelected: imageButtonSelected!, imageNonSelected: imageButtonNonSelected!)
        
        moveLabels(newStatement1: selectedStatementBelow, newStatement2: selectedStatement, newStatement3: statement3.text, newStatement4: statement4.text)
    }
    
    @IBAction func arrowDownStatement2Action(_ sender: UIButton) {
    }
    
    @IBAction func arrowUpStatement3Action(_ sender: UIButton) {
    }
  
    @IBAction func arrowDownStatement3Action(_ sender: UIButton) {
    }
    
    @IBAction func arrowUpStatement4Action(_ sender: UIButton) {
    }
    
    



}

