//
//  ChooseThemeViewController.swift
//  Concentration
//
//  Created by Wiley on 2019/6/4.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class ChooseThemeViewController: UIViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
        ) -> Bool {
        
        //此处加入设备判断，iPhone设备才执行下面的代码
        if let cvc = secondaryViewController as? ConcentrationViewController{
            
            return cvc.theme == nil
        }
        
        return false
    }

    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "Choose Theme", let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            if let cvc = segue.destination as? ConcentrationViewController {
                cvc.theme = theme
            }
        }
    }
 

}
