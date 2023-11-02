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
        signUpLabel.font = Fonts.apply(.title, .semibold)
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
    
    @IBAction func loginButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed() {
        guard let name = nameTextField.text, !name.isEmpty else {
            //TODO - Highlight field with error
            print("name error")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            //TODO - Highlight field with error
            print("email error")
            return
        }
        
        guard isValidEmail(email) else {
            //TODO - Highlight field with error that email is not valid
            print("email format error")
            return
        }
        
        guard let username = usernameTextField.text, !username.isEmpty else {
            //TODO - Highlight field with error
            print("username error")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            //TODO - Highlight field with error
            print("password error")
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty, confirmPassword == password else {
            //TODO - Highlight field with error
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
        guard let tabVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "TabVC") as? UITabBarController else {
            return
        }
        let navigationController = UINavigationController(rootViewController: tabVC)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalPresentationCapturesStatusBarAppearance = true
        dismiss(animated: false) {[weak self] in
            self?.present(navigationController, animated: true)
        }
    }
}
