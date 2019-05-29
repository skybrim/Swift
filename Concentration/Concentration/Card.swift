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
    static private var identifierFactor = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactor += 1
        return identifierFactor
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
    
}

extension Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(identifier)
    }
    
    //实现 equal（==） 的方法
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
}
