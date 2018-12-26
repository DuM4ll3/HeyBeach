//
//  AuthViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class AuthViewController: UIViewController, AuthView {
    
    // - MARK: AuthView
    var onLoginButtonTap: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        onLoginButtonTap?()
    }
}
