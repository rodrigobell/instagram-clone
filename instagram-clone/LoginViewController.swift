//
//  LoginViewController.swift
//  instagram-clone
//
//  Created by Rodrigo Bell on 3/5/17.
//  Copyright © 2017 Rodrigo Bell. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("User log in successful")
                self.performSegue(withIdentifier: "login-segue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }

    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("User sign up successful")
                self.performSegue(withIdentifier: "login-segue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
}

