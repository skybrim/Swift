//
//  ViewController.swift
//  PlayingCard
//
//  Created by Wiley on 2019/5/30.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for _ in 0...10 {
            if let card = deck.drawCard() {
                print("\(card)")
            }
        }
    }
}

