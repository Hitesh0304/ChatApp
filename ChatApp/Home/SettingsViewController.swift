//
//  SettingsViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-16.
//

import UIKit
import ChatAppStrings
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        logOutButton.setTitle(Strings.logout, for: .normal)
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
