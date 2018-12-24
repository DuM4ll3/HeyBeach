//
//  UIViewControllerExtensions.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

extension UIViewController {
    // instantiate a view controller with that identifier, and force cast as the type that was requested
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func inStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func inStoryboard(_ storyboard: UIStoryboard) -> Self {
        return inStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func fromStoryboard(_ storyboard: Storyboards) -> Self {
        return inStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}