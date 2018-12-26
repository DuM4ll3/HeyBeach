//
//  AuthCoordinator.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 25/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class AuthCoordinator: BaseCoordinator {
    
    private let factory: AuthModuleFactory
    private let router: RouterType
    
    init(router: RouterType, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showAuth()
    }
    
    private func showAuth() {
        var authView = factory.makeAuthView()
        authView.onLoginButtonTap = {
            // TODO...
        }
        
        router.push(authView)
    }
}
