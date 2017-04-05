//
//  FeedVC.swift
//  SocialDevSlopes
//
//  Created by Laura Calinoiu on 03/04/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signoutTapped(_ sender: UIButton) {
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try? FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "backToSignin", sender: nil)
    }
}
