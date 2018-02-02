//
//  Ship.swift
//  NavyBattle
//
//  Created by Jeremy IGONIN on 02/02/2018.
//  Copyright © 2018 Jeremy IGONIN. All rights reserved.
//

import Foundation

struct Ship {
    let cases: [CasePosition]
    let striked: Bool = false
    
    var description: String {
        var description = "Bateau"
        switch cases.count {
        case 2:
            description = "Torpilleur"
        case 3:
            description = "Contre-torpilleur"
        default:
            break
        }
        return description
    }
    
    func length() -> Int {
        return cases.count
    }
    
    func isAt(casePosition: CasePosition) -> Bool {
        var isAt = false
        for oneOfMyCasePosition in cases {
            if casePosition == oneOfMyCasePosition {
                isAt = true
                break
            }
        }
        return isAt
    }
    
    
    func isShipEntirelyStriked(gameBoard: [CasePosition: CaseState]) -> Bool {
        var entirelyStriked = true
        for casePosition in cases {
            if gameBoard[casePosition] == nil {
                entirelyStriked = false
                break
            }
        }
        return entirelyStriked
    }
}
