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

class ServiceTypeVC_Back: PFQueryCollectionViewController {
    
    let services = ["Düğün","Fotoğraf","Gelinlik","Kuaför","Transfer"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(ServiceTypeCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20) / 2, height: self.collectionView.frame.size.height / 3)


    }


    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return services.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ServiceTypeCell
        cell.name.text = services[indexPath.item]
    
        // Configure the cell
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.systemOrange.cgColor
        cell?.layer.borderWidth = 10
    }

}
