//
//  Coordinator.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol Coordinator: AnyObject {
    // if you want to run a new flow you need to create a Coordinator using a factory and call start()
    func start()
}

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {}
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        if childCoordinators.index(where: { $0 === coordinator }) == nil {
            childCoordinators.append(coordinator)
        }
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        // clear child-coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }
        
        // remove dependency
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
