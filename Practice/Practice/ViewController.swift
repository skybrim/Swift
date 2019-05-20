//
//  ViewController.swift
//  Practice
//
//  Created by Wiley on 2019/5/20.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(homeTableView)
        
        
    }


    let homeTableView = UITableView(frame: .zero, style: .plain)
    

    
}

