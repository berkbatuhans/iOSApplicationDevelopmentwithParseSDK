//
//  Service.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import UIKit

class Service {
    static let shared = Service() // singleton
    private init(){}
    
    func showAlert(withTitle title: String, withMessage message: String, withActionTitle actionTitle: String,viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: .default) { (action: UIAlertAction) in
        }
        alertController.addAction(alertAction)
        
        if let presenter = viewController.popoverPresentationController {
            presenter.sourceView = viewController.view
            presenter.sourceRect = viewController.view.bounds
        }
        
        viewController.present(alertController,animated: true,completion: nil)
    }
    
    func goToDestination(destinationName: String,viewController: UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: destinationName)
        viewController.present(vc,animated: true,completion: nil)
    }
    
}
