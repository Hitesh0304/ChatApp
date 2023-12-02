//
//  ContactsViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-16.
//

import UIKit
import ChatAppUIKit
import ChatAppStrings

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        setupColors()
        setupStrings()
        setupFonts()
    }
}

extension ContactsViewController {
    
    func setupColors() {
        view.backgroundColor = Colors.background.color
        contactsLabel.textColor = Colors.text.color
    }
    
    func setupStrings() {
        contactsLabel.text = Strings.contacts
    }
    
    func setupFonts() {
        contactsLabel.font = Fonts.apply(.title, .bold)
    }
}
