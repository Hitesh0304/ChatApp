//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-14.
//

import UIKit
import ChatAppUIKit
import ChatAppStrings

class ChatListViewController: UIViewController {

    @IBOutlet weak var chatsLabel: UILabel!
    @IBOutlet weak var showChatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColors()
        setupStrings()
        setupFonts()
    }

    @IBAction func showChatPressed(_ sender: UIButton) {
        guard let chatVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "ChatVC") as? ChatViewController else {
            return
        }
        
        self.tabBarController?.navigationController?.pushViewController(chatVC, animated: true)
    }
}

extension ChatListViewController {
    
    func setupColors() {
        view.backgroundColor = Colors.background.color
        chatsLabel.textColor = Colors.text.color
    }
    
    func setupStrings() {
        chatsLabel.text = Strings.chats
    }
    
    func setupFonts() {
        chatsLabel.font = Fonts.apply(.title, .bold)
    }
}
