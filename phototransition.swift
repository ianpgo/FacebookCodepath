//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    var transitionImage: UIImageView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let toViewController = toViewController as! PhotoDetailViewController
        
        print(feedViewController.touchedImageView.frame)
        
//        let convertedInitialPoint = CGPoint(x: feedViewController.touchedImageView.frame.origin.x, y: feedViewController.touchedImageView.frame.origin.y + feedViewController.feedScrollView.frame.origin.y)
        
//        print(convertedInitialPoint)
        
        //let convertedInitialPoint = feedViewController.touchedImageView.convert(feedViewController.touchedImageView.frame.origin, to: containerView)
        
        transitionImage = UIImageView()
        transitionImage.image = feedViewController.touchedImageView.image
        
        print(feedViewController.touchedImageView.frame)
        
        let frame = containerView.convert(feedViewController.touchedImageView.frame, from: feedViewController.touchedImageView.superview)
        
        print(frame)

        transitionImage.frame = frame
        transitionImage.contentMode = feedViewController.touchedImageView.contentMode
        transitionImage.clipsToBounds = feedViewController.touchedImageView.clipsToBounds
        
        containerView.addSubview(transitionImage)
        
        toViewController.view.alpha = 0
        
        toViewController.detailImageView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {

            self.transitionImage.frame = toViewController.detailImageView.frame
            
            let convertedDetailFrame = containerView.convert(toViewController.detailImageView.frame, from: toViewController.detailImageView.superview)
            
            //let convertedPoint = toViewController.detailImageView.convert(self.transitionImage.frame.origin, to: containerView)
            
            self.transitionImage.frame = convertedDetailFrame
            
            toViewController.view.alpha = 1
            
        }) { (finished: Bool) -> Void in
            toViewController.detailImageView.alpha = 1
            self.transitionImage.isHidden = true
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let fromViewController = fromViewController as! PhotoDetailViewController
        
        //testImage = UIImageView()
        
        let convertedInitialPoint = fromViewController.detailImageView.convert(fromViewController.detailImageView.frame.origin, to: containerView)
        
        transitionImage.isHidden = false
        
        transitionImage.frame = fromViewController.detailImageView.frame
        transitionImage.frame.origin = convertedInitialPoint
        transitionImage.image = fromViewController.detailImageView.image
        transitionImage.contentMode = fromViewController.detailImageView.contentMode
        transitionImage.clipsToBounds = true
        
        //containerView.addSubview(testImage)
        
        fromViewController.view.alpha = 1
        
        fromViewController.detailImageView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            
            self.transitionImage.frame = feedViewController.touchedImageView.frame
            
            let convertedPoint = CGPoint(x: feedViewController.touchedImageView.frame.origin.x, y: feedViewController.touchedImageView.frame.origin.y + feedViewController.feedScrollView.frame.origin.y)
            
            self.transitionImage.frame.origin = convertedPoint
            
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
