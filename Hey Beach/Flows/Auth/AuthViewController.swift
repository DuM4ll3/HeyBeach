//
//  AuthViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class AuthViewController: UIViewController, AuthView {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    // MARK: - AuthView
    // MARK: Inputs
    var onLoginButtonTap: ((User) -> Void)?
    var onSignUpButtonTap: ((User) -> Void)?
    var onLogoutButtonTap: (() -> Void)?
    
    // MARK: Outputs
    func userDidLogin() {
        print("Welcome \(emailTextField.text)")
    }
    
    // MARK: - ViewController
    @IBAction func didTapLoginButton() {
        guard let user = createUser() else { return }
        onLoginButtonTap?(user)
    }
    
    @IBAction func didTapSignUpButton() {
        guard let user = createUser() else { return }
        onSignUpButtonTap?(user)
    }
    
    private func createUser() -> User? {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            email.isEmpty == false,
            password.isEmpty == false
            else { return nil }
        
        return User(email: email, password: password)
    }
}
