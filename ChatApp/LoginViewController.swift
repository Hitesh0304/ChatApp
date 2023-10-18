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

    }
    
    @IBAction func signUpButtonPressed() {
        guard let signUpVC = UIStoryboard(name: "Registration", bundle: nil).instantiateViewController(identifier: "SignUpVC") as? SignUpViewController else {
            return
        }
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
