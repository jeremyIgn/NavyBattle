//
//  GameBoard.swift
//  NavyBattle
//
//  Created by Jeremy IGONIN on 02/02/2018.
//  Copyright © 2018 Jeremy IGONIN. All rights reserved.
//

import Foundation


struct theGameBoard{
    
var gameBoard: [CasePosition: CaseState] = [CasePosition : CaseState]()
    
    
static func displayBoard(gameBoard: [CasePosition: CaseState]) {
    var headline = "  "
    for column in columns {
        headline += "|\(column)"
    }
    headline += "|"
    print(headline)
    for line in lines {
        var printLine = String(format: "%*2d", 2, line) // https://en.wikipedia.org/wiki/Printf_format_string
        printLine += "|"
        for column in columns {
            let casePosition = CasePosition(line: line, column: column)
            var character: Character = " "
            if let caseState = gameBoard[casePosition] {
                character = caseState.rawValue
            }
            printLine.append(character)
            printLine += "|"
        }
        print(printLine)
    }
}
static func allShipsStricked(ships: [Ship], gameBoard: [CasePosition: CaseState]) -> Bool {
    var allShipsStricked = true
    for ship in ships {
        if ship.isShipEntirelyStriked(gameBoard: gameBoard) == false {
            allShipsStricked = false
            break
        }
    }
    return allShipsStricked
}
    
static func isAShipAtThisPosition(_ casePosition: CasePosition, ships: [Ship]) -> Ship? {
    for ship in ships {
        if ship.isAt(casePosition: casePosition) {
            return ship
        }
    }
    return nil
}

static func positionShips() -> [Ship] {
    let contreTorpilleurCases = [CasePosition(line: 1, column: "B"), CasePosition(line: 2, column: "B"), CasePosition(line: 3, column: "B")]
    let contreTorpilleur = Ship(cases: contreTorpilleurCases)
    let torpilleurCases = [CasePosition(line: 4, column: "E"), CasePosition(line: 4, column: "F")]
    let torpilleur = Ship(cases: torpilleurCases)
    let torpilleurCases2 = [CasePosition(line: 10, column: "I"), CasePosition(line: 10, column: "J")]
    let torpilleur2 = Ship(cases: torpilleurCases2)
    return [torpilleur2,torpilleur, contreTorpilleur]
}


static func nextPositionToPlayWillBeAtRight(previousOne: CasePosition?) -> CasePosition {
    if let previousOne = previousOne {
        if previousOne.line == 10 {
            let index = columns.index(of: previousOne.column)! + 1
            let column = columns[index]
            return CasePosition(line: 1, column: column)
        } else {
            return CasePosition(line: previousOne.line + 1, column: previousOne.column)
        }
    } else {
        return CasePosition(line: 1, column: "A")
    }
}

}




