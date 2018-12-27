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
    private let service: UserServiceType
    
    init(router: RouterType, factory: AuthModuleFactory, service: UserServiceType) {
        self.factory = factory
        self.router = router
        self.service = service
    }
    
    override func start() {
        showAuth()
    }
    
    private func showAuth() {
        var authView = factory.makeAuthView()
        let userService = service
//        let user = User(email: "test2@test.com", password: "password")
        let completion = userCompletion(view: authView)
        
        authView.onLoginButtonTap = { user in
            userService.login(user, completion)
        }
        
        authView.onSignUpButtonTap = { user in
            userService.register(user, completion)
        }
        
        authView.onLogoutButtonTap = {
            userService.logout(completion)
        }
        
        router.push(authView)
    }
    
    private func userCompletion(view: AuthView) -> (ServiceResult<User>) -> Void {
        return { result in
            switch result {
            case .success:
                view.userDidLogin()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
