//
//  Storyboarded.swift
//  TikFollower
//
//  Created by Le Toan on 6/15/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import Foundation
import UIKit

public enum StoryboardInstantiateType {
    case initial
    case identifier(String)
}

public enum AppStoryboard: String {
    case main = "Main"
}

public protocol StoryboardInstantiatable {
    static var storyboardName: AppStoryboard { get }
//    static var storyboardBundle: Bundle { get }
    static var instantiateType: StoryboardInstantiateType { get }
}

public extension StoryboardInstantiatable where Self: NSObject {
    static var storyboardName: String {
        return storyboardName.rawValue
    }
//    }

//    static var storyboardBundle: Bundle {
//        return Bundle(for: self)
//    }

    private static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName.rawValue, bundle: nil)
    }

    static var instantiateType: StoryboardInstantiateType {
        return .identifier(String(describing: Self.self))
        
    }
}

public extension StoryboardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        switch instantiateType {
        case .initial:
            return storyboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
            
        }
    }
}
