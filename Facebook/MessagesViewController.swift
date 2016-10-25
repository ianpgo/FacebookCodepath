//
//  MessagesViewController.swift
//  Facebook
//
//  Created by Go, Ian on 9/22/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var messagesScrollView: UIScrollView!
    @IBOutlet weak var messagesImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
                messagesScrollView.contentSize = messagesImageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
