//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-14.
//

import UIKit
import ChatAppStrings
import ChatAppUIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupStrings()
        setupFonts()
        setupColors()
    }
}

extension SignUpViewController {
    func setupStrings() {
        signUpLabel.text = Strings.signUp
        nameTextField.placeholder = Strings.name
        emailTextField.placeholder = Strings.email
        usernameTextField.placeholder = Strings.username
        passwordTextField.placeholder = Strings.password
        confirmPasswordTextField.placeholder = Strings.confirmPassword
        signUpButton.setTitle(Strings.signUp, for: .normal)
        loginButton.setTitle(Strings.alreadyHaveAnAccount, for: .normal)
    }
    
    func setupFonts() {
        signUpLabel.font = Fonts.apply(.title, .semibold)
        nameTextField.font = Fonts.apply(.subheadline, .regular)
        emailTextField.font = Fonts.apply(.subheadline, .regular)
        usernameTextField.font = Fonts.apply(.subheadline, .regular)
        passwordTextField.font = Fonts.apply(.subheadline, .regular)
        confirmPasswordTextField.font = Fonts.apply(.subheadline, .regular)
        signUpButton.titleLabel?.font = Fonts.apply(.headline, .semibold)
        loginButton.titleLabel?.font = Fonts.apply(.headline, .semibold)
    }
    
    func setupColors() {
        view.backgroundColor = Colors.background.color
        signUpLabel.textColor = Colors.text.color
        nameTextField.backgroundColor = Colors.secondaryBackground.color
        nameTextField.textColor = Colors.text.color
        emailTextField.backgroundColor = Colors.secondaryBackground.color
        emailTextField.textColor = Colors.text.color
        usernameTextField.backgroundColor = Colors.secondaryBackground.color
        usernameTextField.textColor = Colors.text.color
        passwordTextField.backgroundColor = Colors.secondaryBackground.color
        passwordTextField.textColor = Colors.text.color
        confirmPasswordTextField.backgroundColor = Colors.secondaryBackground.color
        confirmPasswordTextField.textColor = Colors.text.color
        signUpButton.backgroundColor = Colors.primary.color
        signUpButton.tintColor = Colors.white.color
        loginButton.tintColor = Colors.text.color
    }
    
    @IBAction func loginButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed() {
        guard let name = nameTextField.text, !name.isEmpty else {
            showErrorUI(txtfield: nameTextField)
            print("name error")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showErrorUI(txtfield: emailTextField)
            print("email error")
            return
        }
        
        guard isValidEmail(email) else {
            print("email format error")
            showErrorUI(txtfield: emailTextField)
            return
        }
        
        guard let username = usernameTextField.text, !username.isEmpty else {
            showErrorUI(txtfield: usernameTextField)
            print("username error")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showErrorUI(txtfield: passwordTextField)
            print("password error")
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty, confirmPassword == password else {
            showErrorUI(txtfield: confirmPasswordTextField)
            print("confirmPassword error")
            return
        }
        
        //Create User Account
        AuthHandler.shared.signUp(username: username, email: email, password: password) {[weak self] in
            self?.navigateToHome()
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: Strings.emailRegex, options: .caseInsensitive)
            let matches = regex.matches(
                in: email,
                options: [],
                range: NSRange(location: 0, length: email.utf16.count)
            )
            return matches.count > 0
        } catch {
            return false
        }
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
