//
//  PasswordResetVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 2.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

class PasswordResetVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func resetPassword(_ sender: Any) {
        Service.shared.resetPassword(email: emailTextField.text!, vc: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
