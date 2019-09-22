//
//  Service+Auth.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse

extension Service {
    func register(user: PFUser,_ vc: UIViewController) {
        let user = user
        let sv = UIViewController.displaySpinner(onView: vc.view)
        user.signUpInBackground { (success: Bool, error: Error?) in
            UIViewController.removeSpinner(spinner: sv)
            if success {
                //TODO: - Kayıt başarılı ise yönlendir.
                self.goToDestination(destinationName: Identifiers.cities, viewController: vc)
                
            } else {
                
                if let error = error, let code = PFErrorCode(rawValue: error._code) {
                    print(code)
                    switch code {
                    case .errorUsernameMissing:
                        self.showAlert(withTitle: "Kayıt Ol", withMessage: "Kullanıcı Adı Eksik veya Boş", withActionTitle: "Tamam", viewController: vc)
                    default:
                        self.showAlert(withTitle: "Kayıt Ol", withMessage: error.localizedDescription, withActionTitle: "Tamam", viewController: vc)
                        break
                    }
                    
                }
            }
        }
    }
    
    func login(user: PFUser,vc: UIViewController) {
        let user = user
        let sv = UIViewController.displaySpinner(onView: vc.view)
        PFUser.logInWithUsername(inBackground: user.username!, password: user.password!) { (user: PFUser?, error: Error?) in
            UIViewController.removeSpinner(spinner: sv)
            if user != nil {
                //TODO: - Oturum açma başarılı ise yönlendir.
                self.goToDestination(destinationName: Identifiers.cities, viewController: vc)
                
            } else {
                if let description = error?.localizedDescription {
                    self.showAlert(withTitle: "Oturum Aç", withMessage: description, withActionTitle: "Tamam",viewController: vc)
                }
            }
        }
    }
    
    func logout(vc: UIViewController) {
        PFUser.logOutInBackground { (error: Error?) in
            if (error == nil) {
                //MASK - Oturum Açma sayfasına yönlendir.
                self.goToDestination(destinationName: Identifiers.mainVC, viewController: vc)
            } else {
                
                if let description = error?.localizedDescription {
                    //TODO: - HATA Mesajı Alert Extensionu Yaz.
                    self.showAlert(withTitle: "Oturumu Kapat", withMessage: description, withActionTitle: "Tamam",viewController: vc)
                    
                } else {
                    //TODO: - HATA Mesajı Alert Extensionu Yaz. Oturum kapatma hatalı
                    self.showAlert(withTitle: "Oturumu Kapat", withMessage: "Oturum kapatılamıyor", withActionTitle: "Tamam",viewController: vc)
                    
                }
            }
        }
    }
    
    
}
