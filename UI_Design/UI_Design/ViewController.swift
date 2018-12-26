//
//  ViewController.swift
//  UI_Design
//
//  Created by cj on 12/22/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up the side menu animation.
        //This method is in ViewControllerHelper.swift
        sideMenu()
        
        //Set up Navigation Bar 3to1 logo
        //This method is in ViewControllerHelper.swift
        customizeNavigationBar()
        
        //Changes the background of the main view.
        //This method is in addBackground.swift
        self.view.addBackground(imageName: "Background.png")
        

        
        

    }
    


    
    




    

}
