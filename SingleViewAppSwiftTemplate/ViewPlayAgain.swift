//
//  ViewPlayAgain.swift
//  BoutTime
//
//  Created by Markus Flodmark on 2017-01-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

// Global variables
var roundsFromView: Int = 0
var pointsFromView: Int = 0

class ViewPlayAgain: UIViewController {
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showText()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showText() {
        score.text = "\(pointsFromView) / \(roundsFromView)"
    }
    
    // must put figures in variables and letting viewdidload load before setting score.text value
    func showScore(points: Int, rounds: Int){
        pointsFromView = points
        roundsFromView = rounds
        // show score and let the player decide if starting new play
    }
    
     
     // MARK: - Navigation
 
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
