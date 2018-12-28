//
//  AuthViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class AuthViewController: UIViewController, AuthView {
    
    // MARK: - AuthView
    // MARK: Inputs
    var onLoginButtonTap: ((User) -> Void)?
    var onSignUpButtonTap: ((User) -> Void)?
    var onLogoutButtonTap: (() -> Void)?
    
    // MARK: Outputs
    func userDidLogin() {
        welcomeLabel.text = String(format: "Welcome %@ 😀", emailTextField.text ?? "")
        welcomeLabel.isHidden = false
    }
    
    func userDidNotLogin() {
        welcomeLabel.text = String(format: "Couldn't login/register %@ ☹️", emailTextField.text ?? "")
        welcomeLabel.isHidden = false
    }
    
    // MARK: - ViewController
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func didTapLoginButton() {
        guard let user = createUser() else { return }
        onLoginButtonTap?(user)
    }
    
    @IBAction func didTapSignUpButton() {
        guard let user = createUser() else { return }
        onSignUpButtonTap?(user)
    }
    
    private func createUser() -> User? {
        view.endEditing(true)
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            email.isEmpty == false,
            password.isEmpty == false
            else { return nil }
        
        return User(email: email, password: password)
    }
}
