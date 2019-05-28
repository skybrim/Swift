//
//  Card.swift
//  Concentration
//
//  Created by Wiley on 2019/5/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    //静态方法
    static var identifierFactor = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactor += 1
        return identifierFactor
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
    
}
