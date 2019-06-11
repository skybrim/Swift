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
        if imageURL == nil {
            imageURL = Bundle.main.url(forResource: "banter-snaps-1667073-unsplash", withExtension: "jpg")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
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
        if let url = imageURL {
            if let imageData = try? Data(contentsOf: url) {
                image = UIImage(data: imageData)
            }
        }
    }
}

