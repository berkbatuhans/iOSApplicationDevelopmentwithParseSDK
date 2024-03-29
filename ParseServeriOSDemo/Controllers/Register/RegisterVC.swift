//
//  RegisterVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

class RegisterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet fileprivate var signUpUsernameField: UITextField!
    @IBOutlet fileprivate var signUpPasswordField: UITextField!
    @IBOutlet fileprivate var firstName: UITextField!
    @IBOutlet fileprivate var lastName: UITextField!
    @IBOutlet fileprivate var userEmail: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpPasswordField.text = ""
        signUpUsernameField.text = ""
        firstName.delegate = self
        lastName.delegate = self
        userEmail.delegate = self
        signUpUsernameField.delegate = self
        signUpPasswordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_sender: UIButton) {
        errorLabel.text = ""
        let register = Register(firstName: firstName.text!, lastName: lastName.text!, userName: signUpUsernameField.text!, userEmail: userEmail.text!, password: signUpPasswordField.text!, comfirmPassword: signUpPasswordField.text!)
//
//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//            do {
//                try register.checkAllRequirements()
//                register.saveUserAsync(completion: { (result, success) in
//                    if success {
//                        //TODO: - Kayıt başarılı ise yönlendir.
//                        Destination.go(destination: Identifiers.cities, from: self)
//
//                    } else {
//                        Alert.present(title: "Kayıt Ol", message: "Kullanıcı adı eksik veya boş", actions: .close, from: self!)
//                    }
//
//                })
//            } catch let error as ParseError {
//                DispatchQueue.main.async {
//                    self?.errorLabel.text = error.description
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    self?.errorLabel.text = "Something wrong"
//                }
//
//            }
//        }

        let user = PFUser()
        user["firstName"] = register.firstName!
        user["lastName"] = register.lastName
        user.username = register.userName
        user.email = register.userEmail
        user.password = register.password
        Service.shared.register(user: user, self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
