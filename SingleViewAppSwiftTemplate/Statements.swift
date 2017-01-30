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
    case pacioretty = "Max Pacioretty"
    case benn = "Jamie Benn"
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
    var statement: String
    
}

func createStatement(player: Player, pointType: PointType, points: Int, season: Season) -> StatementSetUp {
    let statementPlayers = "Player: \(player.rawValue) \nType: \(pointType) \nSeason: \(season.rawValue)"
    let setUp = StatementSetUp(player: player, pointType: pointType, points: points, season: season, statement: statementPlayers)
    return setUp
}
class Statements {
    
    // Array of statements that is used as text for the labels
    var statementsArray: [StatementSetUp] = [
        createStatement(player: .crosby, pointType: .Assists, points: 49, season: .fiftheenSixteen),
        createStatement(player: .crosby, pointType: .Goals, points: 36, season: .fiftheenSixteen),
        createStatement(player: .crosby, pointType: .Shots, points: 248, season: .fiftheenSixteen),
        createStatement(player: .crosby, pointType: .PIMs, points: 42, season: .fiftheenSixteen),
        createStatement(player: .crosby, pointType: .PlusMinus, points: 19 , season: .fiftheenSixteen),
        createStatement(player: .crosby, pointType: .Points, points: 85, season: .fiftheenSixteen),
        createStatement(player: .pacioretty, pointType: .Assists, points: 34, season: .fiftheenSixteen),
        createStatement(player: .pacioretty, pointType: .Goals, points: 30, season: .fiftheenSixteen),
        createStatement(player: .pacioretty, pointType: .Shots, points: 303, season: .fiftheenSixteen),
        createStatement(player: .pacioretty, pointType: .PIMs, points: 34, season: .fiftheenSixteen),
        createStatement(player: .pacioretty, pointType: .PlusMinus, points: -10, season: .fiftheenSixteen),
        createStatement(player: .pacioretty, pointType: .Points, points: 64, season: .fiftheenSixteen),
        createStatement(player: .benn, pointType: .Assists, points: 48, season: .fiftheenSixteen),
        createStatement(player: .benn, pointType: .Goals, points: 41, season: .fiftheenSixteen),
        createStatement(player: .benn, pointType: .Shots, points: 247, season: .fiftheenSixteen),
        createStatement(player: .benn, pointType: .PIMs, points: 64, season: .fiftheenSixteen),
        createStatement(player: .benn, pointType: .PlusMinus, points: 7, season: .fiftheenSixteen),
        createStatement(player: .benn, pointType: .Points, points: 89, season: .fiftheenSixteen),
        createStatement(player: .burns, pointType: .Assists, points: 48, season: .fiftheenSixteen),
        createStatement(player: .burns, pointType: .Goals, points: 27, season: .fiftheenSixteen),
        createStatement(player: .burns, pointType: .Shots, points: 353, season: .fiftheenSixteen),
        createStatement(player: .burns, pointType: .PIMs, points: 53, season: .fiftheenSixteen),
        createStatement(player: .burns, pointType: .PlusMinus, points: -5, season: .fiftheenSixteen),
        createStatement(player: .burns, pointType: .Points, points: 75, season: .fiftheenSixteen),
        createStatement(player: .karlsson, pointType: .Assists, points: 66, season: .fiftheenSixteen),
        createStatement(player: .karlsson, pointType: .Goals, points: 16, season: .fiftheenSixteen),
        createStatement(player: .karlsson, pointType: .Shots, points: 248, season: .fiftheenSixteen),
        createStatement(player: .karlsson, pointType: .PIMs, points: 50, season: .fiftheenSixteen),
        createStatement(player: .karlsson, pointType: .PlusMinus, points: -2, season: .fiftheenSixteen),
        createStatement(player: .karlsson, pointType: .Points, points: 82, season: .fiftheenSixteen),
        createStatement(player: .tarasenko, pointType: .Assists, points: 34, season: .fiftheenSixteen),
        createStatement(player: .tarasenko, pointType: .Goals, points: 40, season: .fiftheenSixteen),
        createStatement(player: .tarasenko, pointType: .Shots, points: 292, season: .fiftheenSixteen),
        createStatement(player: .tarasenko, pointType: .PIMs, points: 37, season: .fiftheenSixteen),
        createStatement(player: .tarasenko, pointType: .PlusMinus, points: 7, season: .fiftheenSixteen),
        createStatement(player: .tarasenko, pointType: .Points, points: 74, season: .fiftheenSixteen)
    ]
    
    var randomStatementArray: [StatementSetUp] = []

    
    func randomStatement() -> Int {
        var indexOfSelectedStatement = GKRandomSource.sharedRandom().nextInt(upperBound: statementsArray.count)
        
        // Check unique random number
        while checkUsedNumbers(number: indexOfSelectedStatement) == true {
            indexOfSelectedStatement = GKRandomSource.sharedRandom().nextInt(upperBound: statementsArray.count)
        }
        
        return indexOfSelectedStatement
    }
    
    var usedNumbers: [Int] = []
    var used: Bool = false

    func checkUsedNumbers(number: Int) -> Bool {
        used = false
        
        //Check if it's in the usedNumbers array
        for usedNumber in usedNumbers {
            if usedNumber == number {
                used = true
            } else {
                used = false
            }
        }
        
        // append used number tp array
        usedNumbers.append(number)

        //Return true or false
        return used
    }
    
    func addToRandomStatementArray(statement: StatementSetUp) {
        randomStatementArray.append(statement)
    }
    
    func sortPointsOfRandomStatementArray() {
        // Fix correct order of statement, largest point at index 0
        randomStatementArray.sort { (one: StatementSetUp, two: StatementSetUp) -> Bool in
            one.points > two.points
        }
        print("randomArrayCount: \(randomStatementArray.count)")
        print(randomStatementArray[0].player)
        print(randomStatementArray[0].points)
        print(randomStatementArray[1].player)
        print(randomStatementArray[1].points)
        print(randomStatementArray[2].player)
        print(randomStatementArray[2].points)
        print(randomStatementArray[3].player)
        print(randomStatementArray[3].points)
    }
}


