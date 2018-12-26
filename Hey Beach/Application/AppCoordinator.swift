//
//  AppCoordinator.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 25/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

/// class responsible to coordinate the main app flow
final class AppCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactoryType
    private let router: RouterType
    
    init(router: RouterType, coordinatorFactory: CoordinatorFactoryType) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runMainFlow()
    }
    
    private func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabBarCoordinator()
        
        addDependency(coordinator)
        router.setRootModule(module)
        
        coordinator.start()
    }
}
