//
//  LoginViewController.swift
//  Facebook
//
//  Created by Go, Ian on 9/29/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fbImageView: UIImageView!
    @IBOutlet weak var fieldSuperView: UIView!
    @IBOutlet weak var labelSuperView: UIView!
    @IBOutlet weak var loginSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    var fbImageViewInitialY: CGFloat!
    var fbImageViewOffset: CGFloat!
    
    var fieldSuperViewInitialY: CGFloat!
    var fieldSuperViewOffset: CGFloat!
    
    var labelSuperViewInitialY: CGFloat!
    var labelSuperViewOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fbImageViewInitialY = fbImageView.frame.origin.y
        fieldSuperViewInitialY = fieldSuperView.frame.origin.y
        labelSuperViewInitialY = labelSuperView.frame.origin.y
        
        fbImageViewOffset = -50
        fieldSuperViewOffset = -75
        labelSuperViewOffset = -225

        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.fbImageView.frame.origin.y = self.fbImageViewInitialY + self.fbImageViewOffset
            self.fieldSuperView.frame.origin.y = self.fieldSuperViewInitialY + self.fieldSuperViewOffset
            self.labelSuperView.frame.origin.y = self.labelSuperViewInitialY + self.labelSuperViewOffset
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.fbImageView.frame.origin.y = self.fbImageViewInitialY
            self.fieldSuperView.frame.origin.y = self.fieldSuperViewInitialY
            self.labelSuperView.frame.origin.y = self.labelSuperViewInitialY
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func didEditTextField(_ sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }

    @IBAction func didTouchLoginButton(_ sender: AnyObject) {
        loginSpinner.startAnimating()
        loginButton.isSelected = true
        
        delay(2){
            self.loginSpinner.stopAnimating()
            self.checkPassword()
        }
    
    }
    
    func checkPassword(){
        if emailField.text == "Ian" && passwordField.text == "password" {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            loginButton.isSelected = false
            //login error
            let alertController = UIAlertController(title: "Incorrect Credentials", message: "Please try again", preferredStyle: .alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "OK", style:.default) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
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
