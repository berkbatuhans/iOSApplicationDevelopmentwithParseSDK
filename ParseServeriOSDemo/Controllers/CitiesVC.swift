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
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        Service.shared.logout(vc: self)
    }
    override func queryForTable() -> PFQuery<PFObject> {
        let query = PFQuery(className: "Cities")
        query.order(byAscending: "name")
        return query
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CitiesCell
        cell.nameLabel.text = object?.object(forKey: "name") as? String
        
        let imageFile = object?.object(forKey: "image") as? PFFileObject
        
        cell.imageView?.image = UIImage(named: "logo")
        cell.cellImageView.file = imageFile
        cell.cellImageView.loadInBackground()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row + 1 > (self.objects?.count)! {
            return 44
        }
        
        let height = super.tableView(tableView, heightForRowAt: indexPath)
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showCitiesDetail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCitiesDetail" {
            //get the index path for the row that was selecte
            //get the PFUser object for that particular row
            let userToShow = (objects?[(self.tableView.indexPathForSelectedRow?.row)!])
            
            //create your new view controller
            let newVc = segue.identifier as? DetailVC
            //assign the new vc's property to your object
            newVc!.currentObject = userToShow
        }
    }
    
 }
