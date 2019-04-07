//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Steven Tran on 4/7/19.
//  Copyright © 2019 Steven Tran. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                // Do stuff after successful sign up.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                // The sign up failed. Check error to see why.
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                // Do stuff after successful login.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                // The login failed. Check error to see why.
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
