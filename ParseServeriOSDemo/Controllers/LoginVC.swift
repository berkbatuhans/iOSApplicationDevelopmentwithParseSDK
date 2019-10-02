//
//  LoginVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController, UITextFieldDelegate {
    @IBOutlet fileprivate var signInUsernameField: UITextField!
    @IBOutlet fileprivate var signInPasswordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInPasswordField.delegate = self
        signInPasswordField.delegate = self
        signInUsernameField.text = ""
        signInPasswordField.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_sender: UIButton) {
        let user = PFUser()
        user.username = signInUsernameField.text!
        user.password = signInPasswordField.text!
        
        //let login = Login(userName: user.username, password: user.password)
        Service.shared.login(user: user,vc: self)//login.loginUser()
//        do {
//            try
//            //self.dismiss(animated: true, completion: nil)
//        } catch let error as ParseError {
//            errorLabel.text = error.description
//        } catch {
//            errorLabel.text = "Sorry something went wrong please try!"
//        }
        
    }
    
    @IBAction func back(_ sender: Any) {
       self.navigationController?.dismiss(animated: true, completion: {
           // completion, do something or make it nil.
       })
    }
    
}
