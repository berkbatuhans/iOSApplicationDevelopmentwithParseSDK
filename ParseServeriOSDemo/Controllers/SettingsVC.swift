//
//  SettingsVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 24.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

private let reuseIdentifier = "SettingsCell"

class SettingsVC: UITableViewController {
    
    
    //MARK: - Properties
    
    var name: String = ""
    var email: String = ""
    
    // var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "userSummaryInformationCell")
        //        configureUI()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let query = PFUser.query()
            query?.whereKey("email", equalTo: PFUser.current()!.email!)
            query?.findObjectsInBackground(block: { (objects, error) in
                let object = objects?.first as! PFUser
                let name = object.value(forKey: "firstName") as! String
                let lastName = object.value(forKey: "lastName") as! String
                let firstLast = name + " " + lastName
                cell.textLabel?.text = firstLast
//                    String(object.email!)
                cell.detailTextLabel?.text = String(object.email!)
            })
            
            
        default:
            break
        }
        return cell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "userSummaryInformationCell", for: indexPath)
        //        if indexPath.section == 0 && indexPath.row == 0 {
        //
        //        let query = PFUser.query()
        //        query?.whereKey("email", equalTo: PFUser.current()!.email!)
        //        query?.findObjectsInBackground(block: { (objects, error) in
        //            let object = objects?.first as! PFUser
        //            cell.textLabel?.text = String(object.email!)
        //            cell.detailTextLabel?.text = String(object.username!)
        //            print(self.name)
        //            print(self.email)
        //        })
        //
        //
        //        } else {
        //            return UITableViewCell()
        //        }
        //        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch (indexPath.section, indexPath.row) {
        case (2,3):
            let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "CitiesVC") as! CitiesVC
            navigationController?.pushViewController(secondViewController, animated: true)
        case (3,2):
            Service.shared.logout(vc: self)
        default:
            break
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
