//
//  TabBarViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController, TabBarView {
    // - MARK: TabBarView
    var onImageFlowSelect: ((UINavigationController) -> ())?
    var onUserFlowSelect: ((UINavigationController) -> ())?
    var onViewDidLoad: ((UINavigationController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
        }
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        if selectedIndex == 0 {
            onUserFlowSelect?(controller)
        } else if selectedIndex == 1 {
            onImageFlowSelect?(controller)
        }
    }
}
