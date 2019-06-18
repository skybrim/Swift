//
//  TextFieldCollectionViewCell.swift
//  EmojiArt
//
//  Created by Wiley on 2019/6/18.
//  Copyright © 2019 wiley. All rights reserved.
//

import UIKit

class TextFieldCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    var handleText: (() -> Void)?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handleText?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
