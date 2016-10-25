//
//  FeedViewController.swift
//  Facebook
//
//  Created by Go, Ian on 9/22/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var feedScrollView: UIScrollView!

    @IBOutlet weak var simulateNetworkSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var infiniteLoadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var touchedImage: UIImage!
    var touchedImageView: UIImageView!
    
    var refreshControl: UIRefreshControl!
    
    var fadeTransition: FadeTransition!
    var photoTransition: PhotoTransition!
    
    // Define variable to keep track of added ImageViews.
    // Initial Value of 1 represents the initial ImageView
    var numberOfImageViews: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScrollView.delegate = self
        
        feedScrollView.contentSize = feedImageView.frame.size
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        feedScrollView.insertSubview(refreshControl, at: 0)
        
        // Position the Activity Indicator 20px below the bottom feed ImageView
        infiniteLoadingSpinner.center.y = feedImageView.frame.size.height + 20
        
        // Set the ScrollView bottom Content Inset to 130px
        feedScrollView.contentInset.bottom = 100


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        feedImageView.isHidden = true
        simulateNetworkSpinner.startAnimating()
        
        delay(2){
            self.feedImageView.isHidden = false
            self.simulateNetworkSpinner.stopAnimating()
        }
    }
 

    
    func onRefresh() {
        run(after: 2) {
            self.refreshControl.endRefreshing()
        }
    }
    
    // Implement the delay method
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    func scrollViewDidScroll(_ feedScrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(_ feedScrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ feedScrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(_ feedScrollView: UIScrollView) {
        print("Scrolling Stopped")
        // If the scrollView offset + the scrollview height is greater than or equal to the height of the scrollView content,
        // We have reached the bottom, so...
        if feedScrollView.contentOffset.y + feedScrollView.frame.size.height >= feedScrollView.contentSize.height {
            print("You reached the bottom")
            // Delay for 1 second then...
            delay(1, closure: { () -> () in
                // Create frame for new imageView, same as feed ImageView
                let newFrame = self.feedImageView.frame
                // Create new ImageView with newFrame
                let newImageView = UIImageView(frame: newFrame)
                // Create new image, same as feed Image
                let newImage = UIImage(named: "home_feed")
                // Set new ImageView image to newImage
                newImageView.image = newImage
                // Position the new imageView below the previous image view
                newImageView.frame.origin.y = self.feedImageView.frame.origin.y + self.numberOfImageViews * self.feedImageView.frame.size.height
                // Add imageView to scrollView
                feedScrollView.addSubview(newImageView)
                // Move Activity Indicator down below new ImageView
                self.infiniteLoadingSpinner.center.y = self.feedImageView.image!.size.height + 20 + self.numberOfImageViews * newImageView.image!.size.height
                // Increase the feedScrollView contentSize with each additional imageView added using
                feedScrollView.contentSize = CGSize(width: self.feedImageView.frame.size.width,
                                                    height: self.feedImageView.frame.size.height + self.numberOfImageViews * newImageView.frame.size.height)
                // add 1 to scrollViewCount
                self.numberOfImageViews += 1
            })
        }
    }
    
    @IBAction func didTouchPhoto(_ sender: UITapGestureRecognizer) {
        let senderImageView = sender.view as! UIImageView
        
        print(sender.view?.frame)
        
        touchedImageView = UIImageView()
        
        touchedImage = senderImageView.image
        touchedImageView.image = senderImageView.image
        touchedImageView.frame = senderImageView.frame
        touchedImageView.contentMode = senderImageView.contentMode
        touchedImageView.clipsToBounds = senderImageView.clipsToBounds
        
        performSegue(withIdentifier: "segueToPhotoDetail", sender: nil)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let photoDetailVC = segue.destination as! PhotoDetailViewController
        photoDetailVC.sentImage = touchedImage
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destination
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        photoTransition = PhotoTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = photoTransition
        
        // Adjust the transition duration. (seconds)
        photoTransition.duration = 0.5
    }
 

}
