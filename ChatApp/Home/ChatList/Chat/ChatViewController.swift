//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-11-04.
//

import UIKit
import ChatAppStrings
import ChatAppUIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var messages: [Message] = []

    private lazy var timeFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        loadMessages()
        setupColors()
        setupFonts()
    }
    
    func loadMessages() {
        ChatHandler.shared.loadMessages { [weak self] messages in
            self?.messages = messages
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                if !messages.isEmpty {
                    DispatchQueue.main.async {
                        let indexPath = IndexPath(row: messages.count - 1, section: 0)
                        self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                }
                
            }
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, !messageBody.isEmpty {
            ChatHandler.shared.sendMessage(msgBody: messageBody) { [weak self] isSuccessful in
                if isSuccessful {
                    self?.messageTextField.text = nil
                }
            }
        }
    }
    
    func setupColors() {
        view.backgroundColor = Colors.background.color
        messageTextField.backgroundColor = Colors.secondaryBackground.color
        messageTextField.textColor = Colors.text.color
    }
    
    func setupFonts() {
        messageTextField.font = Fonts.apply(.headline, .regular)
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        
        let messageTime = timeFormatter.string(from: Date(timeIntervalSince1970: message.date))
        
        //Message from current user
        if message.sender == ChatHandler.shared.messageSender {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.rightImageView.image = UIImage(named: "me-image")
            cell.messageBubble.backgroundColor = Colors.secondaryBackground.color
            cell.leftTimeLabel.isHidden = false
            cell.rightTimeLabel.isHidden = true
            cell.leftTimeLabel.text = messageTime
        }
        
        //Message from another sender
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.leftImageView.image = UIImage(named: "you-image")
            cell.messageBubble.backgroundColor = Colors.secondaryBackground.color
            cell.leftTimeLabel.isHidden = true
            cell.rightTimeLabel.isHidden = false
            cell.rightTimeLabel.text = messageTime
        }
        
        return cell
    }
}
