//
//  GradientView.swift
//  prototype
//
//  Created by Developer on 11/12/19.
//  Copyright © 2019 CS Seniors. All rights reserved.
//

import UIKit

class GradientView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 255.0/256.0, green: 122.0/256.0, blue: 122.0/256.0, alpha: 1).cgColor, UIColor.white.cgColor]
    }
}
