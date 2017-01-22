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
    
    
    // Arrays
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        roundedCorners()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Functions
    
    func roundedCorners() {
        statement1.layer.cornerRadius = 5

    }

    
    func showSelectedArrow(button: UIButton, imageSelected: UIImage, imageNonSelected: UIImage) {
        
        button.setBackgroundImage(imageSelected, for: UIControlState.normal)
        
        // Take back first image with delay
        loadWithDelay(seconds: 1, button: button, imageNonselected: imageNonSelected)

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
        imageButtonSelected = #imageLiteral(resourceName: "down_full_selected")
        imageButtonNonSelected = #imageLiteral(resourceName: "down_full")
        selectedStatement = statement1.text
        selectedStatementBelow = statement2.text
        selectedStatementAbove = nil
        
        
        // FIXME: fix unwrapping
        showSelectedArrow(button: sender, imageSelected: imageButtonSelected!, imageNonSelected: imageButtonNonSelected!)
        moveLabels(newStatement1: selectedStatementBelow, newStatement2: selectedStatement, newStatement3: statement3.text, newStatement4: statement4.text)
    }



}

