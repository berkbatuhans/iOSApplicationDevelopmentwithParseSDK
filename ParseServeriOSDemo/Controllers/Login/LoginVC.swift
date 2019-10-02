//
//  LoginVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController {
    @IBOutlet fileprivate var signInUsernameField: UITextField!
    @IBOutlet fileprivate var signInPasswordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInUsernameField.delegate = self
        signInUsernameField.text = ""
        signInUsernameField.tag = 0
        signInUsernameField.returnKeyType = .next
        
        signInPasswordField.delegate = self
        signInPasswordField.text = ""
        signInPasswordField.tag = 1
        signInPasswordField.returnKeyType = .go
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_sender: UIButton) {
        let user = PFUser()
        user.username = signInUsernameField.text!
        user.password = signInPasswordField.text!
        Service.shared.login(user: user,vc: self)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: {
        })
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
}


extension LoginVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) else {
            textField.resignFirstResponder()
            return true
            
        }
        nextTextField.becomeFirstResponder()
        return false
    }
}
