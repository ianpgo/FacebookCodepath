//
//  MoreViewController.swift
//  Facebook
//
//  Created by Go, Ian on 9/22/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var moreScrollView: UIScrollView!
    @IBOutlet weak var moreImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreScrollView.contentSize = moreImageView.frame.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogout(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Are you sure you want to logout?", message: "We'll miss you", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .destructive) { (action) in
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            
            
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }

        
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
