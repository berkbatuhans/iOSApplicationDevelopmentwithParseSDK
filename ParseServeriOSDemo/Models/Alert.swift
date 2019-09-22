//
//  Alert.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 22.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    static func present(title: String?, message: String,actions: Alert.Action..., from controller: UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action.alertAction)
        }
        controller.present(alertController,animated: true,completion: nil)
    }
}

extension Alert {
    enum Action {
        case ok(handler:(() -> Void)?)
        case retry(handler:(() -> Void)?)
        case close
        
        private var title: String {
            switch self {
            case .ok:
                return "Tamam"
            case .retry:
                return "Retry"
            case .close:
                return "Kapat"
            }
        }
        
        private var handler: (() -> Void)? {
            switch self {
            case .ok(let handler):
                return handler
            case .retry(let handler):
                return handler
            case .close:
                return nil
            }
        }
        
        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }
    
    
}
