//
//  ViewController.swift
//  Bandaid
//
//  Created by George Drag on 7/19/16.
//  Copyright © 2016 George Drag. All rights reserved.
//

import UIKit



class protectedViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let auth = UserDefaults.standard().string(forKey: "userAuthenticated")
        if (auth != "YES")
        {
        self.performSegue(withIdentifier: "loginView", sender: self)
        }
       
    }
    
    
    @IBAction func LogoutTouch(_ sender: AnyObject) {
        
        let key = "userAuthenticated"
        let defaults = UserDefaults.standard()
        defaults.removeObject(forKey: key)
        defaults.synchronize()
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
}

