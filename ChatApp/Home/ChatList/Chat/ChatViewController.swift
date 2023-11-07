//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-11-04.
//

import UIKit
import ChatAppStrings
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        loadMessages()
        sendButton.setTitle(Strings.send, for: .normal)
        
    }
    
    func loadMessages() {
        db.collection("messages")
            .order(by: "dateField")
            .addSnapshotListener() { (querySnapshot, error) in
                
                self.messages = []
                
                if let e = error {
                    print("Error getting documents: \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if let messageSender = data["senderField"] as? String, let messageBody = data["bodyField"] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: [
                "senderField": messageSender,
                "bodyField": messageBody,
                "dateField": Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("Issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data.")
                }
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].body
        return cell
    }
}
