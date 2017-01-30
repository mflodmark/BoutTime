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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // FIXME: fatal error
    func showScore(points: Int, rounds: Int) {
        //score.text = "\(points)/\(rounds)"
    }
    
     
     // MARK: - Navigation
 
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
}
