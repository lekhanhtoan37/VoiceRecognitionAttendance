//
//  GenericViewController.swift
//  TikFollower
//
//  Created by Le Toan on 6/17/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

open class GenericViewController<V: UIView>: UIViewController {
    override open func loadView() {
        self.view = V()
    }
}
