//
//  SettingsVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 24.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

class SettingsVC: UITableViewController {
    
    //MARK: - Properties
    
// var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!

    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureUI()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 && indexPath.row == 3 {
//            Destination.go(destination: Identifiers.cities, from: self,presentationStyle: .formSheet)
            let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "CitiesVC") as! CitiesVC
            navigationController?.pushViewController(secondViewController, animated: true)
            
        } else if indexPath.section == 2  && indexPath.row == 2 {
                Service.shared.logout(vc: self)
        }
        
    }
    

    //MARK: - Helper Functions
//    func configureTableView(){
//        tableView = UITableView()
//        //tableView.delegate = self
//        //tableView.dataSource = self
//        tableView.rowHeight = 60
//
//        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
//        view.addSubview(tableView)
//        tableView.frame = view.frame
//
//        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
//        userInfoHeader = UserInfoHeader(frame: frame)
//        tableView.tableHeaderView = userInfoHeader
//        tableView.tableFooterView = UIView()
//        if #available(iOS 13.0, *) {
//            tableView.overrideUserInterfaceStyle = .light
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
//    func configureUI() {
//        configureTableView()
//
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barStyle = .black
//        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
//        navigationItem.title = "Ayarlar"
//
//    }

}


//extension SettingsVC : UITableViewDelegate, UITableViewDataSource {
//
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 5
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath) as! SettingsCell
////        return cell
////    }
//
//}
