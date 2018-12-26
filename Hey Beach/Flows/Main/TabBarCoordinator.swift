//
//  TabBarCoordinator.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 25/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class TabBarCoordinator: BaseCoordinator {
    
    private var tabBarView: TabBarView
    private let coordinatorFactory: CoordinatorFactoryType
    
    init(tabBarView: TabBarView, coordinatorFactory: CoordinatorFactoryType) {
        self.tabBarView = tabBarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabBarView.onViewDidLoad = runAuthFlow()
        tabBarView.onUserFlowSelect = runAuthFlow()
        tabBarView.onImageFlowSelect = runImagesFlow()
    }
    
    private func runAuthFlow() -> ((UINavigationController) -> ()) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let authCoordinator = self.coordinatorFactory.makeAuthCoordinator(navController: navController)
                self.addDependency(authCoordinator)
                authCoordinator.start()
            }
        }
    }
    
    private func runImagesFlow() -> ((UINavigationController) -> ()) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let imagesCoordinator = self.coordinatorFactory.makeImagesCoordinator(navController: navController)
                self.addDependency(imagesCoordinator)
                imagesCoordinator.start()
            }
        }
    }
}
