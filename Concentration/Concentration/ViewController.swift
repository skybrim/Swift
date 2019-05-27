//
//  ViewController.swift
//  Concentration
//
//  Created by Wiley on 2019/5/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //lazy，需要时才初始化，可以使用全局变量
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count/2)
    //属性观察器，flipCount变化时，改变flipCountLabel的文字
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "FlipCount:\(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func flipCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    //model修改，更新View
    func updateViewFromModel() {
        
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp == true {
                //卡牌朝上
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            } else {
                //卡牌朝下
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    //获取emoji
    var emojiChoices =  ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count-1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

