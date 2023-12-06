//
//  ChatHandler.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-11-07.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ChatHandler {
    static let shared = ChatHandler()
    private let db = Firestore.firestore()
    
    private init() {
        
    }
    
    var messageSender: String? {
        return Auth.auth().currentUser?.email
    }
    
    func loadMessages(completion: @escaping([Message]) -> Void) {
        
        db.collection("messages")
            .order(by: "dateField")
            .addSnapshotListener() { [weak self] (querySnapshot, error) in
                
                var messages = [Message]()
                
                if let e = error {
                    print("Error getting documents: \(e)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if let messageSender = data["senderField"] as? String, let messageBody = data["bodyField"]  as? String, let messageDate = data["dateField"] as? TimeInterval {
                            let newMessage = Message(sender: messageSender, body: messageBody, date: messageDate)
                            messages.append(newMessage)
                        }
                    }
                    completion(messages)
                }
            }
    }
    
    func sendMessage(msgBody: String, completion: @escaping (Bool) -> Void) {
        db.collection("messages").addDocument(data: [
            "senderField": Auth.auth().currentUser?.email,
            "bodyField": msgBody,
            "dateField": Date().timeIntervalSince1970
        ]) { (error) in
            if let e = error {
                print("Issue saving data to firestore, \(e)")
                completion(false)
            } else {
                print("Successfully saved data.")
                completion(true)
            }
        }
    }
}
