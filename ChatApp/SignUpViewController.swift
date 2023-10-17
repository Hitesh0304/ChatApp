//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-14.
//

import UIKit
import ChatAppStrings

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupStrings()
    }
}

extension SignUpViewController {
    func setupStrings() {
        signUpLabel.text = Strings.signUp
        nameLabel.text = Strings.name
        emailLabel.text = Strings.email
        usernameLabel.text = Strings.username
        passwordLabel.text = Strings.password
        confirmPasswordLabel.text = Strings.confirmPassword
        signUpButton.setTitle(Strings.signUp, for: .normal)
        loginButton.setTitle(Strings.login, for: .normal)
    }
}
