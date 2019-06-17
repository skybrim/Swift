//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by wiley on 2019/6/15.
//  Copyright © 2019 wiley. All rights reserved.
//

import UIKit

class EmojiArtView: UIView, UIDropInteractionDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        addInteraction(UIDropInteraction(delegate: self))
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSAttributedString.self) { (providers) in
            let dropPoint = session.location(in: self)
            for attributeString in providers as? [NSAttributedString] ?? [] {
                self.addLabel(attributeString: attributeString, center: dropPoint)
            }
        }
    }
    
    private func addLabel(attributeString: NSAttributedString, center: CGPoint) {
        let label = UILabel()
        label.backgroundColor = .clear
        label.attributedText = attributeString
        addEmojiArtGestureRecognizers(to: label)
        label.sizeToFit()
        label.center = center
        addSubview(label)
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        backgroundImage?.draw(in: bounds)
    }
 
    var backgroundImage: UIImage? { didSet{ setNeedsDisplay() } }
    
}
