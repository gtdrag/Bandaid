//
//  ViewController.swift
//  Bandaid
//
//  Created by George Drag on 7/19/16.
//  Copyright © 2016 George Drag. All rights reserved.
//

import UIKit
import UsergridSDK

class LoginViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginUser(username: "poop", password: "Poop1111")
    }

    func loginUser(username: String, password: String) {
        let userAuth = UsergridUserAuth(username: username, password: password)
        Usergrid.sharedInstance.authenticateUser(userAuth) { (auth, user, error) in
            if user != nil && error == nil {
                LoginViewController.showAlert(viewController: self, title: "Login Success", message: user?.description)
            }
        }
    }

    class func showAlert(viewController: UIViewController, title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alertController, animated: true)
    }

}

