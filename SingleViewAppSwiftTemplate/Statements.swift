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

struct StatementSetUp {
    var player: Player
    var pointType: PointType
    var points: Int
    var year: Int
}

class Statements {
    // Array of statements that is used as text for the labels
    var statementsArray: [StatementSetUp] = [
        StatementSetUp(player: .crosby, pointType: .Assists, points: 50, year: 2015),
        StatementSetUp(player: .burns, pointType: .Assists, points: 40, year: 2015),
        StatementSetUp(player: .karlsson, pointType: .Goals, points: 30, year: 2015),
        StatementSetUp(player: .benn, pointType: .Goals, points: 45, year: 2015)
        
    ]
    
    var randomStatementArray: [StatementSetUp] = []

    
    func randomStatement() -> StatementSetUp {
        let indexOfSelectedStatement = GKRandomSource.sharedRandom().nextInt(upperBound: statementsArray.count)
        let statementDictionary = statementsArray[indexOfSelectedStatement]
        
        return statementDictionary
        
        // Return text that is suppose to be on each label
        //let statementText = "Player: \(statementDictionary.player) \nType: \(statementDictionary.pointType) \nPoints: \(statementDictionary.points) \nYear: \(statementDictionary.year)"
        //return statementText
    }
    
    func addToRandomStatementArray(statement: StatementSetUp) {
        randomStatementArray.append(statement)
    }
    
    func removeFromStatementArray(index: Int) {
        statementsArray.remove(at: index)
    }
    
    func checkPointsOfRandomStatementArray() {
        
    }
}


