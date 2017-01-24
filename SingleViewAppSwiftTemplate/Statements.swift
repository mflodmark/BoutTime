//
//  Statements.swift
//  BoutTime
//
//  Created by Markus Flodmark on 2017-01-22.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit


enum Player: String {
    case crosby = "Sidney Crosby"
    case pachioretty = "Max Pachioretty"
    case benn = "Jamei Benn"
    case toews = "Jonathan Toews"
    case mcdavid = "Connor McDavid"
    case malkin = "Evgeni Malkin"
    case karlsson = "Erik Karlsson"
    case burns = "Brent Burns"
    case kane = "Patrick Kane"
    case tarasenko = "Vladimir Tarasenko"
    case scheifele = "Mark Scheifele"
    case panarin = "Artemi Panarin"
    case kucherov = "Nikita Kucherov"
    case pavelski = "Joe Pavelski"
}

enum PointType: String {
    case Goals
    case Assists
    case Points
    case PIMs
    case Shots
    case PlusMinus
}

enum Season: String {
    case fiftheenSixteen = "2015/16"
}

struct StatementSetUp {
    var player: Player
    var pointType: PointType
    var points: Int
    var season: Season
}

class Statements {
    // Array of statements that is used as text for the labels
    var statementsArray: [StatementSetUp] = [
        StatementSetUp(player: .crosby, pointType: .Assists, points: 50, season: .fiftheenSixteen),
        StatementSetUp(player: .burns, pointType: .Assists, points: 40, season: .fiftheenSixteen),
        StatementSetUp(player: .karlsson, pointType: .Goals, points: 30, season: .fiftheenSixteen),
        StatementSetUp(player: .benn, pointType: .Goals, points: 45, season: .fiftheenSixteen)
        
    ]
    
    var randomStatementArray: [StatementSetUp] = []

    
    func randomStatement() -> Int {
        let indexOfSelectedStatement = GKRandomSource.sharedRandom().nextInt(upperBound: statementsArray.count)
        
        return indexOfSelectedStatement
    }
    
    func addToRandomStatementArray(statement: StatementSetUp) {
        randomStatementArray.append(statement)
    }
    
    func removeFromStatementArray(index: Int) {
        statementsArray.remove(at: index)
    }
    
    func sortPointsOfRandomStatementArray() {
        // Fix correct order of statement, largest point at index 0
        randomStatementArray.sort { (one: StatementSetUp, two: StatementSetUp) -> Bool in
            one.points < two.points
        }
    }
}


