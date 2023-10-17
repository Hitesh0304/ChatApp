//
//  ViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-13.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.setTitle("Login", for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
    }

    @IBAction func loginButtonPressed() {
        guard let loginVC = UIStoryboard(name: "Registration", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else {
            return
        }
        
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func signUpButtonPressed() {
        guard let signUpVC = UIStoryboard(name: "Registration", bundle: nil).instantiateViewController(identifier: "SignUpVC") as? SignUpViewController else {
            return
        }
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

}

