//
//  AuthView.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

/// actions to be defined by its coordinator
protocol AuthViewInputs {
    var onLoginButtonTap: ((User) -> Void)? { get set }
    var onSignUpButtonTap: ((User) -> Void)? { get set }
    var onLogoutButtonTap: (() -> Void)? { get set }
}

protocol AuthViewOutputs {
    func userDidLogin()
    func userDidNotLogin()
}

typealias AuthViewType = BaseView & AuthViewInputs & AuthViewOutputs

protocol AuthView: AuthViewType {}
