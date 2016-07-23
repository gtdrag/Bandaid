//
//  LoginViewController.swift
//  Bandaid
//
//  Created by George Drag on 7/23/16.
//  Copyright © 2016 George Drag. All rights reserved.
//

import UIKit
import UsergridSDK

class LoginViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonTouch(_ sender: AnyObject) {
        
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        
        if (userEmail!.isEmpty || userPassword!.isEmpty){
            LoginViewController.showAlert(viewController: self, title: "Oops", message:"missing login info")
        }
        
        loginUser(username: userEmail!, password: userPassword!)
        
        //username: "poop", password: "Poop1111"
    }
    
    
    func loginUser(username: String, password: String) {
        let userAuth = UsergridUserAuth(username: username, password: password)
        Usergrid.sharedInstance.authenticateUser(userAuth) { (auth, user, error) in
            if user != nil && error == nil {
               
            
                let key = "userAuthenticated"
                let defaults = UserDefaults.standard()
                defaults.setValue("YES", forKey: key)
                defaults.synchronize()
                self.performSegue(withIdentifier: "loginSuccess", sender: self)
                
                
            }
            else {
                LoginViewController.showAlert(viewController: self, title: "Login Failed", message: user?.description)

            }
        }
    }
    
    class func showAlert(viewController: UIViewController, title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alertController, animated: true)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
