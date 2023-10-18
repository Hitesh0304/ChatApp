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
        signUpLabel.font = Fonts.apply(.title, .regular)
    }
}

extension SignUpViewController {
    func setupStrings() {
        signUpLabel.text = Strings.signUp
//        nameLabel.text = Strings.name
//        emailLabel.text = Strings.email
//        usernameLabel.text = Strings.username
//        passwordLabel.text = Strings.password
//        confirmPasswordLabel.text = Strings.confirmPassword
        signUpButton.setTitle(Strings.signUp, for: .normal)
        loginButton.setTitle(Strings.login, for: .normal)
    }
}
