//
//  BasePopupView.swift
//  TikFollower
//
//  Created by Le Toan on 6/17/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

protocol BasePopupView {
    associatedtype T: UIViewController
//    func showAnimate()
//    func removeAnimate()
}

extension BasePopupView {
    func showAnimate(vc: T) {
        vc.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        vc.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            vc.view.alpha = 1.0
            vc.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }

    func removeAnimate(vc: T, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.25, animations: {
            vc.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            vc.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                vc.willMove(toParent: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParent()
                completion?()
            }
        })
    }
}
