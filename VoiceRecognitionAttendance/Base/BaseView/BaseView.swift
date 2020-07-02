//
//  BaseView.swift
//  TikFollower
//
//  Created by Le Toan on 6/17/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

class BaseView: UIView {
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit() {
        contentView = loadNib()
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
