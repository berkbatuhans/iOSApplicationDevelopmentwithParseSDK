//
//  Register.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse

class Login: NSObject {
    init(userName: String?, password: String?) {
        self.userName = userName
        self.password = password
    }
    
    var userName: String?
    var password: String?
    
    func loginUser() throws -> Bool {
        guard hasEmptyFields() else {
            throw ParseError.EmptyField
        }
        
        
        guard checkUserCredentials() else {
            throw ParseError.IncorrectSignIn
        }
        
        return true
    }
    
    func hasEmptyFields() -> Bool {
        if !userName!.isEmpty && !password!.isEmpty {
            return true
        }
        return false
    }
    
    
    func checkUserCredentials() -> Bool {
        PFUser.logInWithUsername(inBackground: userName!, password: password!)
        return PFUser.current() != nil ? true : false
    }
    
}
