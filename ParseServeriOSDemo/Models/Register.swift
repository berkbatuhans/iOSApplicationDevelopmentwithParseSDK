//
//  Register.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse

class Register: NSObject {
    init(firstName: String?, lastName: String?, userName: String?, userEmail: String?, password: String?, comfirmPassword: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.userEmail = userEmail
        self.password = password
        self.comfirmPassword = comfirmPassword
    }
    
    var firstName: String?
    var lastName: String?
    var userName: String?
    var userEmail: String?
    var password: String?
    var comfirmPassword: String?
    
    func registerUser() throws -> Bool {
        guard hasEmptyFields() else {
            throw ParseError.EmptyField
        }
        
        guard isValidEmail() else {
            throw ParseError.InvalidEmail
        }
        
        guard validatePasswordsMatch() else {
            throw ParseError.PasswordsDoNotMatch
        }
        
        guard checkPasswordSufficientComplexity() else {
            throw ParseError.InvalidPassword
        }
        
        guard storeSuccessfulRegister() else {
            throw ParseError.UserNameTaken
        }
        
        return true
    }
    
    func hasEmptyFields() -> Bool {
        if !firstName!.isEmpty && !lastName!.isEmpty && !userName!.isEmpty && !userEmail!.isEmpty && !password!.isEmpty && !comfirmPassword!.isEmpty {
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        let emailEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-].\\.[A-Za-z]"
        let range = userEmail?.matches(emailEx)
        let result = range != nil ? true : false
        return result
    }
    
    func validatePasswordsMatch() -> Bool {
        return (password! == comfirmPassword!) ? true : false
    }
    
    func checkPasswordSufficientComplexity() -> Bool {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@",capitalLetterRegEx)
        let capitalResult = textTest.evaluate(with: password!)
        print("Capital letter: \(capitalResult)")
        
        let numberRegEx = ".*[0-9]+.*"
        let textTest2 = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = textTest2.evaluate(with: password!)
        print("Number included: \(numberResult)")
        
        let lengthResult = password!.count >= 8
        print("Passed length: \(lengthResult)")
        
        return capitalResult && numberResult && lengthResult
    }
    
    func storeSuccessfulRegister() -> Bool {
        var success = false
        let user = PFUser()
        user["firstName"] = firstName!
        user["lastName"] = lastName!
        user.username = userName!
        user.email = userEmail!
        user.password = password!
        
        try! user.signUp()
        
        success = user.isNew
        
        return success
    }
    
}
