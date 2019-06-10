//
//  ViewController.swift
//  PlayingCard
//
//  Created by Wiley on 2019/5/30.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var cardViews: [PlayingCardView]!
    
    lazy var animator = UIDynamicAnimator(referenceView: view)
    lazy var cardBehavior = CardBehavior(in: animator)
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var cards = [PlayingCard]()
        for _ in 0...((cardViews.count+1)/2) {
            let card = deck.drawCard()!
            cards += [card, card]
        }
        for playingCardView in cardViews {
            playingCardView.isFaceUp = false
            let card = cards.remove(at: cards.count.arc4random)
            playingCardView.suit = card.suit.rawValue
            playingCardView.rank = card.rank.order
            playingCardView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(flipCard(_:))))
            cardBehavior.addItem(playingCardView)
        }
    }
    
    private var faceUpViews: [PlayingCardView] {
        
        return cardViews.filter{ $0.isFaceUp }
    }
    
    private var isFaceUpViewMatch: Bool {
        
        return faceUpViews.count == 2 && faceUpViews[0].suit == faceUpViews[1].suit && faceUpViews[0].rank == faceUpViews[1].rank
    }
    
    private var lastClickView: PlayingCardView?
    
    @objc func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            if let clickView = sender.view as? PlayingCardView, faceUpViews.count < 2 {
                cardBehavior.removeItem(clickView)
                lastClickView = clickView
                UIView.transition(
                    with: clickView,
                    duration: 0.5,
                    options: [.transitionFlipFromLeft],
                    animations: {
                        clickView.isFaceUp = !clickView.isFaceUp
                }){ (finished) in
                    if self.isFaceUpViewMatch {
                        UIViewPropertyAnimator.runningPropertyAnimator(
                            withDuration: 0.6,
                            delay: 0,
                            options: [],
                            animations: {
                                self.faceUpViews.forEach {
                                    $0.transform = CGAffineTransform.identity.scaledBy(x: 3.0, y: 3.0)
                                }
                        },
                            completion: { (UIViewAnimatingPosition) in
                                UIViewPropertyAnimator.runningPropertyAnimator(
                                    withDuration: 0.6,
                                    delay: 0,
                                    options: [],
                                    animations: {
                                        self.faceUpViews.forEach {
                                            $0.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1)
                                            $0.alpha = 0
                                        }
                                },
                                    completion: { (UIViewAnimatingPosition) in
                                        self.faceUpViews.forEach {
                                            $0.isHidden = true
                                            $0.alpha = 1
                                            $0.transform = .identity
                                        }
                                })
                        })
                    } else if self.faceUpViews.count == 2 {
                        if self.lastClickView == clickView {
                            UIViewPropertyAnimator.runningPropertyAnimator(
                                withDuration: 0.5,
                                delay: 0,
                                options: [.transitionFlipFromLeft],
                                animations: {
                                    self.faceUpViews.forEach {
                                        $0.isFaceUp = false
                                    }
                            })
                        }
                    }
                }
            }
        default:
            break
        }
    }
}

