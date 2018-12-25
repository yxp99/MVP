//
//  ViewController.swift
//  UI_Design
//
//  Created by cj on 12/22/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up the side menu animation.
        sideMenu()
        
        //Changes the background of the main view.
        self.view.addBackground(imageName: "Background.png")
        
    }
    



    func sideMenu(){
        //Helper function for the sideMenu animation. NOTHING SHOULD BE CHANGED IN THIS FUNCTION.
        if revealViewController() != nil{
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 150
            //revealViewController()?.view.addBackground(imageName: "MenuSlider.png")
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
