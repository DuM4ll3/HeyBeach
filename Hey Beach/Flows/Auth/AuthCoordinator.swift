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
            let service: UserServiceType = UserService()
            let user = User(email: "test2@test.com", password: "password")
            let completion = self.userCompletion()
            service.login(user, completion)
        }
        
        router.push(authView)
    }
    
    private func userCompletion() -> (ServiceResult<User>) -> Void {
        return { result in
            switch result {
            case .success:
                print("User logged in")
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
