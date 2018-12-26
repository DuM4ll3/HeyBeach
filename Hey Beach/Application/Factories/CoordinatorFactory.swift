//
//  CoordinatorFactory.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol CoordinatorFactoryType {
    // returns the coordinator & the rootController - TabBarViewController
    func makeTabBarCoordinator() -> (coordinator: Coordinator, toPresent: Presentable?)
    func makeAuthCoordinator(navController: UINavigationController) -> Coordinator
    func makeImagesCoordinator(navController: UINavigationController) -> Coordinator
}

final class CoordinatorFactory: CoordinatorFactoryType {
    func makeTabBarCoordinator() -> (coordinator: Coordinator, toPresent: Presentable?) {
        let controller = TabBarViewController.fromStoryboard(.main)
        let coordinator = TabBarCoordinator(tabBarView: controller, coordinatorFactory: CoordinatorFactory())
        return (coordinator, controller)
    }
    
    func makeAuthCoordinator(navController: UINavigationController) -> Coordinator {
        let coordinator = AuthCoordinator(router: router(navController), factory: ModuleFactory())
        return coordinator
    }
    
    func makeImagesCoordinator(navController: UINavigationController) -> Coordinator {
        let coordinator = ImagesCoordinator(router: router(navController), factory: ModuleFactory())
        return coordinator
    }
    
    private func router(_ navController: UINavigationController) -> Router {
        return Router(rootController: navController)
    }
}
