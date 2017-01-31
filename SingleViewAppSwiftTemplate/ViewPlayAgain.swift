//
//  ViewPlayAgain.swift
//  BoutTime
//
//  Created by Markus Flodmark on 2017-01-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

class ViewPlayAgain: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    
    var roundsFromView: Int = 0
    var pointsFromView: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // show score and let the player decide if starting new play
        // concatinating without divding the numbers
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
    func showScore(points: Int, rounds: Int) {
        print("showScore")
        pointsFromView = points
        roundsFromView = rounds
    }
    
     
     // MARK: - Navigation
 
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
}
