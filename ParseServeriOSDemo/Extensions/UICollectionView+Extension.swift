//
//  UICollectionView+Extension.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 1.10.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse
extension PFQueryCollectionViewController {
    
    func deselectAllItems(animated: Bool = false) {
        guard let selectedItems = collectionView.indexPathsForSelectedItems else { return }
        for indexPath in selectedItems { collectionView.deselectItem(at: indexPath, animated: animated) }
    }
}

extension UICollectionView {
    func deselectAllItems(animated: Bool = false) {
        
        for indexPath in self.indexPathsForSelectedItems ?? [] {
            print("\(indexPath) deselect edildi.")
            self.deselectItem(at: indexPath, animated: animated)
        }
    }
}

