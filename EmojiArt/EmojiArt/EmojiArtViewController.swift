//
//  EmojiArtViewController.swift
//  EmojiArt
//
//  Created by wiley on 2019/6/15.
//  Copyright © 2019 wiley. All rights reserved.
//

import UIKit

class EmojiArtViewController: UIViewController, UIDropInteractionDelegate, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dropZone: UIView! {
        didSet {
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
    }
    
    //MARK: - UIDropInteractionDelegate
    //这个方法返回是否响应此放置目的地的放置请求
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        
        return true
    }
    //设置以何种方式响应拖放会话行为
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    var imageFetcher: ImageFetcher!
    
    //已经应用拖放行为后执行的操作
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher(handler: { (url, image) in
            DispatchQueue.main.async {
                self.emojiArtBackgroundImage = image
            }
        })
        
        session.loadObjects(ofClass: NSURL.self) { (nsurls) in
            if let url = nsurls.first as? URL {
                self.imageFetcher.fetch(url)
            }
        }
        
        session.loadObjects(ofClass: UIImage.self) { (images) in
            if let image = images.first as? UIImage {
                self.imageFetcher.backup = image
            }
        }
    }

    
    //MARK: - ScrollView
    var emojiArtView = EmojiArtView()
    
    var emojiArtBackgroundImage: UIImage? {
        get {
            return emojiArtView.backgroundImage
        }
        set {
            scrollView?.zoomScale = 1.0
            emojiArtView.backgroundImage = newValue
            let size = newValue?.size ?? CGSize.zero
            emojiArtView.frame = CGRect(origin: CGPoint.zero, size: size)
            scrollView?.contentSize = size
            scrollViewHeight?.constant = size.height
            scrollViewWidth?.constant = size.width
            if let dropZone = self.dropZone, size.width > 0, size.height > 0 {
                scrollView?.zoomScale = max(dropZone.bounds.size.width / size.width, dropZone.bounds.size.height / size.height)
            }
        }
    }
    
    @IBOutlet weak var scrollViewWidth: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.maximumZoomScale = 5.0
            scrollView.minimumZoomScale = 0.1
            scrollView.delegate = self
            scrollView.addSubview(emojiArtView)
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollViewWidth.constant = scrollView.contentSize.width
        scrollViewHeight.constant = scrollView.contentSize.height
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return emojiArtView
    }
    
    //MARK: - CollectionView
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var emojis = "😀🎁✈️🎱🍎🐶🐝☕️🎼🚲♣️👨‍🎓✏️🌈🤡🎓👻☎️".map { String($0) }
    
    var font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)).withSize(64.0)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath)
        if let emojiCell = cell as? EmojiCollectionViewCell {
            let text = NSAttributedString(string: emojis[indexPath.row], attributes: [.font : font])
            emojiCell.label.attributedText = text
        }
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
