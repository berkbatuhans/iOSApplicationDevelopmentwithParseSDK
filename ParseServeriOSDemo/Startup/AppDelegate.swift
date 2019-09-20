//
//  AppDelegate.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 18.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = ParseClientConfiguration {
            $0.applicationId = "63ynXBEdfQh1kCJ674AwdbVRHrc5FV18pivW26Ti"
            $0.clientKey = "4bqXLMxj9vBUnTZgVCJLH5KNV5Q5HiKLeJgmw3a4"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        
        //saveInstallationObject()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .carPlay]) { (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else {
                print("Kullanıcı push-notification almayı reddetti")
                return
            }
            self.getNotificationSettings()
        }
        
        return true
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification Settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async { UIApplication.shared.registerForRemoteNotifications() }
        }
    }
    
    func saveInstallationObject() {
        if let installation = PFInstallation.current() {
            
            installation.saveInBackground { (success: Bool, error: Error?) in
                if success {
                    print("Uygulama başarı ile Parse-Server'e bağlandı!")
                } else {
                    if let myError = error {
                        print(myError.localizedDescription)
                    }else {
                        print("Bilinmeyen Hata")
                    }
                }
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        createInstallationOnParse(deviceTokenData: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        if (error as NSError).code == 3010 {
            print("Push bildirimleri iOS Simulator'da desteklenmez.")
        } else {
            print("application:didFailToRegisterForRemoteNotificationsWithError: %@", error)
        }
    }
    
    func createInstallationOnParse(deviceTokenData: Data) {
        if let installation = PFInstallation.current() {
            installation.setDeviceTokenFrom(deviceTokenData)
            installation.saveInBackground { (success: Bool, error: Error?) in
                if (success) {
                    print("Uygulama başarı ile bağlandı ve push servisi aktif edildi.")
                } else {
                    if let myError = error {
                        print("Parser server kurulumu yapılırken bir hata oluştu. \(myError.localizedDescription)")
                    } else {
                        print("bilinmeyen hata")
                    }
                }
            }
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if let installation = PFInstallation.current() {
            if installation.badge != 0 {
                installation.badge = 0
                installation.saveEventually()
            }
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    }
    
}

extension AppDelegate : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        PFPush.handle(notification.request.content.userInfo)
        completionHandler(.alert)
    }
}

