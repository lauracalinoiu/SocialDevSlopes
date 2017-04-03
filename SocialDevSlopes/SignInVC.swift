//
//  ViewController.swift
//  SocialDevSlopes
//
//  Created by Laura Calinoiu on 31/03/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    @IBAction func facebookBtnTapped(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(_, _, _):
                print("Logged in!")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: (AccessToken.current?.authenticationToken)! )
                self.firebaseAuthenticate(credential)
            }
        }
    }
    
    func firebaseAuthenticate(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            guard error == nil else { print("Unable to authenticate with Firebase!" )
                return }
            print("Succesfully authenticated with firebase")
            if let user = user {
                self.completeSignIn(user.uid)
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        if let email = emailField.text, let pass = passField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pass) { (user, error) in
                guard error == nil else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pass) { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with Firebase using email")
                        } else {
                            print("Succesfully authenticated with Firebase")
                            if let user = user {
                                self.completeSignIn(user.uid)
                            }
                        }
                    }
                    return
                }
                print("Email user authenticated with Firebase")
                if let user = user {
                    self.completeSignIn(user.uid)
                }
            }
        }
    }
    
    func completeSignIn(_ id: String) {
        KeychainWrapper.standard.set(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

