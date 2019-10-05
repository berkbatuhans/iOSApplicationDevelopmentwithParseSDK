//
//  UIView+Extension.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 30.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
//            self.layer.masksToBounds = newValue > 0
        }
    }
}

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer =  CAGradientLayer()
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


//class GradientView: UIView {
//    lazy fileprivate var gradientLayer: CAGradientLayer = {
//        let layer = CAGradientLayer()
//        layer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.75).cgColor]
//        layer.locations = [NSNumber(value: 0.0 as Float),NSNumber(value: 1.0 as Float)]
//        //.layerMaxXMinYCorner -> Sağ Üst
//        layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
//
//        layer.cornerRadius = 15
//        return layer
//    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        backgroundColor = UIColor.clear
//        layer.addSublayer(gradientLayer)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        gradientLayer.frame = bounds
//        CATransaction.commit()
//    }
//}
