//
//  SignInViewController.swift
//  SnapChat
//
//  Created by Ryan Phillips on 5/2/17.
//  Copyright © 2017 Ryan Phillips. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    @IBAction func goTapped(_ sender: Any) {
        FIRAuth
    }


}

