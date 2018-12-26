//
//  TableViewController.swift
//  UI_Design
//
//  Created by cj on 12/23/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

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


}
