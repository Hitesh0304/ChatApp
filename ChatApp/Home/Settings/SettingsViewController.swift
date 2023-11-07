//
//  SettingsViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-16.
//

import UIKit
import ChatAppStrings
import FirebaseAuth
import ChatAppUIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var personalizeLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStrings()
        setupFonts()
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

extension SettingsViewController {
    func setupStrings() {
        settingsLabel.text = Strings.settings
        profileLabel.text = Strings.profile
        logOutButton.setTitle(Strings.logout, for: .normal)
        personalizeLabel.text = Strings.personalize
        themeLabel.text = Strings.theme
        themeControl.setTitle(Strings.light, forSegmentAt: 0)
        themeControl.setTitle(Strings.system, forSegmentAt: 1)
        themeControl.setTitle(Strings.dark, forSegmentAt: 2)
    }
    
    func setupFonts() {
        settingsLabel.font = Fonts.apply(.title, .bold)
        profileLabel.font = Fonts.apply(.title2, .semibold)
        logOutButton.titleLabel?.font = Fonts.apply(.subheadline, .semibold)
        personalizeLabel.font = Fonts.apply(.title2, .semibold)
        themeLabel.font = Fonts.apply(.headline, .regular)
        let fontAttributes: [NSAttributedString.Key: Any] = [
            .font: Fonts.apply(.subheadline, .regular)
                ]
        themeControl.setTitleTextAttributes(fontAttributes, for: .normal)
    }
    
    func setupColors() {
        
    }
}
