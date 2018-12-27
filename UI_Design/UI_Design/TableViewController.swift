//
//  TableViewController.swift
//  UI_Design
//
//  Created by cj on 12/23/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Changes the background of the main view.
        let backgroundImage = UIImage(named: "MenuSlider2.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView  
        
        //Remove Separator lines
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section: \(indexPath.section)")
//        print("row: \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "playScreenSegue", sender: self)
//            emailField.resignFirstResponder()
//            passwordField.becomeFirstResponder()
            break
        case 1:
            self.performSegue(withIdentifier: "smackScreenSegue", sender: self)
//            handleSignIn()
            break
        case 2:
            break
        case 6:
            logout()
            break
            
        default:
            break
        }
    }
    
    private func logout(){
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "initialScreenSegue", sender: self)
    }
}
