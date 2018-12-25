//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by cj on 12/23/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    //create account using email and password
    func createAccount(Email: String, Password: String, ReenterPassword: String ){
        //Check if email is empty
        if Email == ""{
            let alertController = UIAlertController(title: "Error", message: "Please enter an email ", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController,animated: true, completion: nil)
        } else if Password != ReenterPassword{
            let alertController = UIAlertController(title: "Error", message: " Re-entered Password did not match", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController,animated: true, completion: nil)
        } else{
            FirebaseAuth.Auth.auth().createUser(withEmail: Email!, password: Password!){(user, error) in
                if error == nil {
                    //User sign up success
                    print("USER logged in")
                    //Do w/e you should after use log in
                }
                else{
                    //Any error from creating account
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController,animated: true, completion: nil)
                    
                }
                
            }
        }
    }
    
    
    //login function using email and password
    func login(Email: String, Password: String){
        if Email == "" || Password == "" {
            
            
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            FirebaseAuth.Auth.auth().signIn(withEmail: Email!, password: Password!) { (user, error) in
                
                if error == nil {
                    //User log in success
                    print("You have successfully logged in")
                    
                    //Go to the Main Menu if login success
                    
                } else {
                    
                    //Return firebase's login error to user interface
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}

