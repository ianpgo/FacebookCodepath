//
//  ThrillistDetailViewController.swift
//  Facebook
//
//  Created by Go, Ian on 9/22/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class ThrillistDetailViewController: UIViewController {
    @IBOutlet weak var thrillistDetailScrollView: UIScrollView!

    @IBOutlet weak var commentBarSuper: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var thrillistDetailImageView: UIImageView!
    var initialY: CGFloat!
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thrillistDetailScrollView.contentSize = thrillistDetailImageView.image!.size
        initialY = commentBarSuper.frame.origin.y
        offset = -203
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            
            self.commentBarSuper.frame.origin.y = self.initialY + self.offset
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            
            self.commentBarSuper.frame.origin.y = self.initialY
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onComment(_ sender: UIButton) {
        commentTextField.becomeFirstResponder()
    }
    @IBAction func onButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    @IBAction func backToFeed(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
