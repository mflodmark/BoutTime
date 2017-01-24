//
//  Timer.swift
//  BoutTime
//
//  Created by Markus Flodmark on 2017-01-24.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit
import UIKit

class TimerCountdown: UIViewController {
    
    // Declarations
    var timer = Timer()
    var timeRemaining: Int = 60

    func timerStart() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountdown), userInfo: nil, repeats: true)
        
        // Starting time
        timeRemaining = 60
    }

    func timerCountdown() {
        
        // update label on UI
        //nextRound.setTitle("\(timeRemaining)", for: UIControlState.normal)

        // Stop timer & go to next question if 0
        if timeRemaining == 0 {
            // Must invalidate timer before starting a new round, otherwise it becomes a new timer all the time
            timer.invalidate()
            //nextRound() -- add function for next round
        } else {
            timeRemaining -= 1
        }
    }
}
