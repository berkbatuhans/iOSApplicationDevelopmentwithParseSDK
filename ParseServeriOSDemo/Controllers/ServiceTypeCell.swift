//
//  ServiceTypeCell2.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 29.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

class ServiceTypeCell: PFCollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: PFImageView!
    @IBOutlet weak var vfx: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    func set(name: String, image: PFFileObject?) {
        
        self.name.text = name
        let imageFile = image
        self.image.image = UIImage(named: "logo")
        self.image.file = imageFile
        self.image.loadInBackground()
    }
    
    

}
