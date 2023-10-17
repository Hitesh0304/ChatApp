//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-14.
//

import UIKit
import ChatAppStrings

class LoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupStrings()
        
    }
}

extension LoginViewController {
    func setupStrings() {
        loginLabel.text = Strings.login
        usernameLabel.text = Strings.username
        passwordLabel.text = Strings.password
        loginButton.setTitle(Strings.login, for: .normal)
        signUpButton.setTitle(Strings.signUp, for: .normal)
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
