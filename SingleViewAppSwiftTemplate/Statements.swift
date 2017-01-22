//
//  Statements.swift
//  BoutTime
//
//  Created by Markus Flodmark on 2017-01-22.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit


class PlayerFullName {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        let fullNameDescription = "\(firstName) \(lastName)"
        return fullNameDescription
    }
}


enum Player: String {
    case Crosby
    case Pachioretty
}
enum PointType: String {
    case Goals
    case Assists
    case Points
    case PIMs
    case Shots
    case PlusMinus
}

struct StatementSetUp {
    var player: Player
    var pointType: PointType
    var points: Int
    var Year: Int
}

class Statements {
    var statementsArray: [StatementSetUp] = [
        StatementSetUp(player: .Crosby, pointType: .Assists, points: 50, Year: 2015)
        
    ]
    
    func randomStatement() {
        var indexOfSelectedStatement = GKRandomSource.sharedRandom().nextInt(upperBound: statementsArray.count)
        let questionDictionary = statementsArray[indexOfSelectedStatement]
    }
}
