//
//  PhotoDetailViewController.swift
//  Facebook
//
//  Created by Go, Ian on 10/18/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var scrollImageView: UIScrollView!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionImageView: UIImageView!
    
    var sentImageView: UIImageView!
    var sentImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = sentImage
        scrollImageView.delegate = self
        
        scrollImageView.contentSize = detailImageView.frame.size
        
        scrollImageView.contentSize.height += 100

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.4) {
            self.doneButton.alpha = 0
            self.actionImageView.alpha = 0
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return detailImageView
    }
}
