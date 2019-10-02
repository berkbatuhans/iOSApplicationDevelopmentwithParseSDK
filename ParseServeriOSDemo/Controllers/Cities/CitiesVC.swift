 //
 //  CitiesTableViewController.swift
 //  ParseServeriOSDemo
 //
 //  Created by Berk Batuhan ŞAKAR on 18.09.2019.
 //  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
 //
 
 import UIKit
 import Parse
 
 class CitiesVC: PFQueryTableViewController {
    
    override func queryForTable() -> PFQuery<PFObject> {
//        let query = PFQuery(className: "Cities")
//        query.order(byAscending: "name")
        let query = City.query()!
        query.order(byAscending: "stateCode")
        return query
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell? {
        let object = object as! City
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CitiesCell
//        cell.nameLabel.text = object.name
//
//        let imageFile = object.image
//        cell.plateNumber.text = object.stateCode?.stringValue
//        cell.imageView?.image = UIImage(named: "logo")
//        cell.cellImageView.file = imageFile
//        cell.cellImageView.loadInBackground()
        cell.textLabel?.text = object.name
        cell.detailTextLabel?.text = object.stateCode?.stringValue
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row + 1 > (self.objects?.count)! {
//            return 44
//        }
//        
//        let height = super.tableView(tableView, heightForRowAt: indexPath)
//        return 100
//    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "showCitiesDetail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail"
        {
            let controller = (segue.destination as! DetailVC)
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let row = Int(indexPath.row)
                controller.currentObject = objects?[row] as? City
            }
        }
//        if segue.identifier == "showCitiesDetail" {
//            //get the index path for the row that was selecte
//            //get the PFUser object for that particular row
//            let userToShow = (objects?[(self.tableView.indexPathForSelectedRow?.row)!])
//
//            //create your new view controller
//            let newVc = segue.identifier as? DetailVC
//            //assign the new vc's property to your object
//            newVc!.currentObject = userToShow
//        }
    }
    
 }
