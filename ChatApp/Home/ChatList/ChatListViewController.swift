//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-10-14.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var showChatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showChatPressed(_ sender: UIButton) {
        guard let chatVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "ChatVC") as? ChatViewController else {
            return
        }
        
        self.tabBarController?.navigationController?.pushViewController(chatVC, animated: true)
    }
}
