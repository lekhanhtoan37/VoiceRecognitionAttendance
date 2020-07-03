//
//  GradientView.swift
//  TikFollower
//
//  Created by Le Toan on 6/18/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

//@IBDesignable
class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.darkGray.cgColor]
    }
}
