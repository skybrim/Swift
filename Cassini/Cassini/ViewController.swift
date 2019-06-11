//
//  ViewController.swift
//  Cassini
//
//  Created by Wiley on 2019/6/11.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchImage()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var imageURL: URL? {
        didSet {
            image = nil
            if self.view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image ?? nil
        }
        set {
            imageView.image = newValue
        }
    }
    
    private func fetchImage() {
        
    }
}

