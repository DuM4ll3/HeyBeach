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
    
    static let shared = CoordinatorFactory()
    // The private prevents initialization outside of the class.
    private init() {}
    
    func makeTabBarCoordinator() -> (coordinator: Coordinator, toPresent: Presentable?) {
        let controller = TabBarViewController.fromStoryboard(.main)
        let coordinator = TabBarCoordinator(tabBarView: controller, coordinatorFactory: self)
        return (coordinator, controller)
    }
    
    func makeAuthCoordinator(navController: UINavigationController) -> Coordinator {
        let service = UserService()
        let coordinator = AuthCoordinator(router: router(navController), factory: ModuleFactory.shared, service: service)
        return coordinator
    }
    
    func makeImagesCoordinator(navController: UINavigationController) -> Coordinator {
        let service = ImageService()
        let coordinator = ImagesCoordinator(router: router(navController), factory: ModuleFactory.shared, service: service)
        return coordinator
    }
    
    private func router(_ navController: UINavigationController) -> Router {
        return Router(rootController: navController)
    }
}
