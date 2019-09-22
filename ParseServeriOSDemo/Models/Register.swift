//
//  Register.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse

class Register {
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
    
    func checkAllRequirements() throws {
        if !firstName!.isEmpty && !lastName!.isEmpty && !userName!.isEmpty && !userEmail!.isEmpty && !password!.isEmpty && !comfirmPassword!.isEmpty {
            throw ParseError.EmptyField
        }
        
        let emailEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = userEmail?.matches(emailEx)
        let result = range != nil ? true : false
        
        if result == false {
            throw ParseError.InvalidEmail
        }
        
        //        if (password! == password!) {
        //            throw ParseError.PasswordsDoNotMatch
        //        }
        
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
        
        if !capitalResult && !numberResult && !lengthResult {
            throw ParseError.InvalidPassword
        }
    }
    func saveUserAsync(completion:@escaping (_ result: PFUser?,_ success: Bool) -> Void) {
        let user = PFUser()
        user["firstName"] = firstName!
        user["lastName"] = lastName!
        user.username = userName!
        user.email = userEmail!
        user.password = password!
        
        user.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                completion(PFUser.current()!, true)
            } else {
                completion(nil,false)
            }
        }
    }
    
}
