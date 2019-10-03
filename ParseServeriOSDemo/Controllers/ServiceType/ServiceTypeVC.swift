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
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
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
        
        cell.name.text = object.name
        let imageFile = object.image
        cell.image.image = UIImage(named: "logo")
        cell.image.file = imageFile
        cell.image.loadInBackground()
        cell.image.layer.cornerRadius = 15.0

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
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let object = self.objects[indexPath.row] as? ServiceType
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Identifiers.serviceProvider) as! ServiceProviderVC
                   vc.currentObject = object
            self.navigationController?.pushViewController(vc, animated: true)
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
