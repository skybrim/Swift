//
//  Concentration.swift
//  Concentration
//
//  Created by Wiley on 2019/5/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        //选择的卡牌是未匹配的
        if cards[index].isMatched == false {
            //有一张翻开的牌，并且翻开的牌和此次选中的牌不一样
            if indexOfOneAndOnlyFaceUpCard != nil, indexOfOneAndOnlyFaceUpCard != index {
                //翻开选中的牌
                cards[index].isFaceUp = true
                //对比已经翻开的牌和选中的牌
                if cards[index].identifier == cards[indexOfOneAndOnlyFaceUpCard!].identifier {
                    cards[index].isMatched = true
                    cards[indexOfOneAndOnlyFaceUpCard!].isMatched = true
                }
                //置空已经翻开的牌的索引记录
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //两种情况
                //1、没有翻开的牌
                //2、已经翻开两张牌，但是两张牌不匹配
                
                //让所有的牌都朝下
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                //记录选中的卡的索引
                indexOfOneAndOnlyFaceUpCard = index
                //翻开选中的卡
                cards[index].isFaceUp = true
            }
        }
    }
    
    //洗牌
    func shuffCards()  {
       
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 0..<numberOfPairsOfCards {
            
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
    }
}
