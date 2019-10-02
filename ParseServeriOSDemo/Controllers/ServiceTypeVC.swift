//
//  ServiceTypeVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 28.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

private let reuseIdentifier = "Cell"

class ServiceTypeVC: PFQueryCollectionViewController {
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func queryForCollection() -> PFQuery<PFObject> {
        let query = ServiceType.query()!
        return query
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register Cells
        self.collectionView.register(UINib(nibName: "ServiceTypeCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        //SetupGrid View
        self.setupGridView()
        
//        me()
        
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    // MARK: UICollectionViewDataSource
    
    
    func setupGridView(){
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, object: PFObject?) -> PFCollectionViewCell? {
        let object = object as! ServiceType
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ServiceTypeCell
        
        //        cell.set(name: object.name!, image: object.image!)
        cell.name.text = object.name
        let imageFile = object.image
        cell.image.image = UIImage(named: "logo")
        cell.image.file = imageFile
        cell.image.loadInBackground()
        cell.image.layer.cornerRadius = 15.0
//        cell.vfx.isHidden = false
//        cell.vfx.backgroundColor = UIColor.startColor.withAlphaComponent(0.0)
        //rd'a dönüştürme.
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
//        cell.vfx.clipsToBounds = true
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
//        cell.vfx.layer.mask = shapeLayer
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = objects[indexPath.row] as? ServiceType
//        collectionView.deselectItem(at: indexPath, animated: true)
//        let x = objects[indexPath.row] as? ServiceType
//        print("SELECTED \(x!.name)")
//        let vc = storyboard?.instant.instantiateViewController(identifier: Identifiers.serviceProvider) as! ServiceProviderVC
        let vc = storyboard?.instantiateViewController(withIdentifier: Identifiers.serviceProvider) as! ServiceProviderVC
        vc.currentObject = object
//        self.deselectAllItems(animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
//        if #available(iOS 13.0, *) {
//
////            collectionView.deselectItem(at: indexPath, animated: false)
//
//        } else {
//            // Fallback on earlier versions
//        }
//
    }
    
    
//    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        print("deselect")
//
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "serviceProviderVC"
        //        {
        //            if let controller = (segue.destination as! ServiceProviderVC) {
        //
        //            }
        //            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
        //                let row = Int(indexPath.row)
        //                controller.currentObject = objects[row] as? ServiceType
        //            }
        //        }
        
//        if segue.identifier == "serviceProviderVC" {
//            print("segue yakalandı!")
//            if let destination = segue.destination as? ServiceProviderVC {
//                let cell = sender as! ServiceTypeCell
//                let indexPath = collectionView.indexPath(for: cell)
//                let selectedData = objects[(indexPath?.row)!]
//
//                // postedData is the variable that will be sent, make sure to declare it in YourDestinationViewController
//                destination.currentObject = selectedData as! ServiceType
//            }
//        }
    }
    
    
    
    
    
}

extension ServiceTypeVC {
    
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width) / estimatedWidth)
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
        
    }
}
