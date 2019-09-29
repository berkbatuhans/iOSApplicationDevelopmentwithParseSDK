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
                Destination.go(destination: Identifiers.cities,from: vc)
                
            } else {
                
                if let error = error, let code = PFErrorCode(rawValue: error._code) {
                    print(code)
                    switch code {
                    case .errorUsernameMissing:
                        Alert.present(title: "Kayıt Ol", message: "Kullanıcı adı eksik veya boş", actions: .close, from: vc)
                    default:
                        Alert.present(title: "Kayıt Ol", message: error.localizedDescription, actions: .close, from: vc)
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
                Destination.go(destination: Identifiers.cities, from: vc)
                
            } else {
                if let description = error?.localizedDescription {
                    Alert.present(title: "Oturum Aç", message: description, actions: .ok(handler: {
                        print("Oturum Açma Hatası Tamam Butonu")
                    }),.close , from: vc)
                }
            }
        }
    }
    
    func logout(vc: UIViewController) {
        PFUser.logOutInBackground { (error: Error?) in
            if (error == nil) {
                //MASK - Oturum Açma sayfasına yönlendir.
                Destination.go(destination: Identifiers.mainVC, from: vc)
            } else {
                
                if let description = error?.localizedDescription {
                    //TODO: - HATA Mesajı Alert Extensionu Yaz.
                    Alert.present(title: "Oturumu Kapat", message: description, actions: .close, from: vc)
                    
                } else {
                    //TODO: - HATA Mesajı Alert Extensionu Yaz. Oturum kapatma hatalı
                    Alert.present(title: "Oturumu Kapat", message: "Oturum kapatılamıyor", actions: .close, from: vc)
                    
                }
            }
        }
    }
    
    
}
