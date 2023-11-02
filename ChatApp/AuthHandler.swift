//
//  AuthHandler.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-11-01.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthHandler {
    static let shared = AuthHandler()
    private let db = Firestore.firestore()
    
    private init() {
        
    }
    
    func signUp(username: String, email: String, password: String, completion: @escaping () -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (_ , error) in
            if let _ = error {
                print("Something went wrong")
                return
            }
            
            self?.db.collection("usernames").document(username).setData(["email": email]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }

            print("User registered successfully.")
            completion()
        }
    }
    
    func login(username: String, password: String, completion: @escaping() -> Void) {
        let docRef = db.collection("usernames").document(username)

        docRef.getDocument { document, error in
            if let document = document, document.exists, let data = document.data(), let email = data["email"] as? String {
                // Authenticate with Firebase using the retrieved email
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print("Login failed: \(error.localizedDescription)")
                        return
                    }

                    print("User logged in successfully.")
                    completion()
                }
            } else {
                print("Username not found.")
                return
            }
        }
    }
}
