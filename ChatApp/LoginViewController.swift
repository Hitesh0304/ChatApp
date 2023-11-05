//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-14.
//

import UIKit
import ChatAppStrings
import ChatAppUIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupStrings()
        loginLabel.font = Fonts.apply(.title, .semibold)
    }
}

extension LoginViewController {
    func setupStrings() {
        loginLabel.text = Strings.login
        usernameTextField.placeholder = Strings.username
        passwordTextField.placeholder = Strings.password
        loginButton.setTitle(Strings.login, for: .normal)
        signUpButton.setTitle(Strings.dontHaveAnAccount, for: .normal)
    }
    
    @IBAction func loginButtonPressed() {
        guard let username = usernameTextField.text, !username.isEmpty else {
            //TODO - Highlight field with error
            showErrorUI(txtfield: usernameTextField)
            print("username error")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            //TODO - Highlight field with error
            showErrorUI(txtfield: passwordTextField)
            print("password error")
            return
        }
        
        //Login
        AuthHandler.shared.login(username: username, password: password) {[weak self] in
            self?.navigateToHome()
        }
    }
    
    @IBAction func signUpButtonPressed() {
        guard let signUpVC = UIStoryboard(name: "Registration", bundle: nil).instantiateViewController(identifier: "SignUpVC") as? SignUpViewController else {
            return
        }
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func navigateToHome() {
        guard let tabVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "TabBarVC") as? UITabBarController else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: tabVC)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalPresentationCapturesStatusBarAppearance = true
        
        dismiss(animated: false) {[weak self] in
            self?.present(navigationController, animated: true)
        }
    }
    
    func showErrorUI(txtfield: UITextField) {
        txtfield.layer.borderColor = UIColor.red.cgColor
        txtfield.layer.borderWidth = 1.0
    }
}
