//
//  Concentration.swift
//  Concentration
//
//  Created by Wiley on 2019/5/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{ cards[$0].isFaceUp == true }.oneAndOnly
        }
        set {
            for flipdownIndex in cards.indices {
                cards[flipdownIndex].isFaceUp = (newValue == flipdownIndex)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        //选择的卡牌是未匹配的
        if cards[index].isMatched == false {
            //有一张翻开的牌，并且翻开的牌和此次选中的牌不一样
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            
                //对比已经翻开的牌和选中的牌
                if cards[index] == cards[matchIndex] {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                
                //翻开选中的牌，需要放在对比之后，如果先翻开牌，会改变属性 indexOfOneAndOnlyFaceUpCard
                cards[index].isFaceUp = true

            } else {
                //两种情况
                //1、没有翻开的牌
                //2、已经翻开两张牌，但是两张牌不匹配
                //记录选中的卡的索引
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 0..<numberOfPairsOfCards {
            
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
        cards.shuffle() //直接调用系统的方法
        /*
         Fisher-Yates Shuffle算法
         1. 初始化原始数组和新数组，原始数组长度为n(已知)；
         2. 从还没处理的数组（假如还剩k个）中，随机产生一个[0, k)之间的数字p（假设数组从0开始）；
         3. 从剩下的k个数中把第p个数取出；
         4. 重复步骤2和3直到数字全部取完；
         5. 从步骤3取出的数字序列便是一个打乱了的数列。
         */
        
        /*
         经典洗牌算法
         Knuth-Durstenfeld Shuffle，不能计算自增长的数组，会改变原属组
         1. 建立一个数组大小为 n 的数组 arr，分别存放 1 到 n 的数值；
         2. 生成一个从 0 到 n - 1 的随机数
         3. 输出 arr 下标为 x 的数值，即为第一个随机
         4. 将 arr 的尾元素和下标为 x 的元素
         5. 同2，生成一个从 0 到 n - 2 的随机数
         6. 输出 arr 下标为 x 的数值，为第二个随机
         7. 将 arr 的倒数第二个元素和下标为 x 的
         如上，直到输出 m 个数为止
         */
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
