//
//  LoginViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/16/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let mainTabController = storyboard?.instantiateViewController(identifier: "MainTabController") as! MainTabController
        
        // Set initial viewcontroller screen
//        mainTabController.selectedViewController = mainTabController.viewControllers[2]
        
        // UIView animation
        present(mainTabController, animated: true, completion: nil)
    }
}
