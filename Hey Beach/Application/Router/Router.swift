//
//  Router.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 25/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol RouterType {
    func push(_ module: Presentable?)
    func setRootModule(_ module: Presentable?)
}

final class Router: RouterType {
    
    private let rootController: UINavigationController
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func push(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController.pushViewController(controller, animated: true)
    }
    
    func setRootModule(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController.setViewControllers([controller], animated: false)
    }
}
