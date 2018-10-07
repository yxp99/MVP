//
//  ViewController.swift
//  ProtoType 1.1
//
//  Created by cj on 8/31/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftArrow: UIImageView!
    
    //This two references are for the side menu.
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var MenuView: UIView!
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        
        //This line changes the background of the main view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
        
        //These 2 lines are used to give the menu sider a shadow
        MenuView.layer.shadowOpacity = 1
        MenuView.layer.shadowRadius = 6
    }


    @IBAction func openMenu(_ sender: Any) {
        //helper method for the side menu bar.
        if(menuShowing){
            leadingConstraint.constant = -250
        }
        else{
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        menuShowing = !menuShowing
    }
    
    
    func addNavBarImage(){
        //This method adds the navigation bar images.
        let navController = navigationController!
        let image = #imageLiteral(resourceName: "3to1 logo white")
        let imageView = UIImageView(image:image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth/2 - image.size.width/2
        let bannerY = bannerHeight/2 - image.size.height/2
        
        imageView.frame = CGRect(x:bannerX, y:bannerY, width:bannerWidth, height:bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    

}

