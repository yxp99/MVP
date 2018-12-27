//
//  ViewControllerHelper.swift
//  UI_Design
//
//  Created by Shadow Song on 12/25/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0,y: 0.0,width: 1.0,height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func setBackgroundColor(color: UIColor, forUIControlState state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
    
}


extension UIViewController {
    
    
    
    func customizeNavigationBar(){
        //This helper method adds the navigation bar center images and set the image for the two navigation bar buttons.
        
        //Set size for the three icon images.
        let titleImageView = self.resizeImage(image: UIImage(named: "3to1 logo white.png")!, targetSize: CGSize(width: 100.0, height: 100.0))
        let hamburgerIcon = self.resizeImage(image: UIImage(named: "hamburger menu.png")!, targetSize: CGSize(width: 34.0, height: 34.0))
        let scoreBoardIcon = self.resizeImage(image: UIImage(named: "score card unselected.png")!, targetSize: CGSize(width: 34.0, height: 34.0))
        
        //Use the images above for the buttons in navigation bar.
        navigationItem.titleView = UIImageView(image:titleImageView)
        if(navigationItem.leftBarButtonItem != nil){
            //A single check nil if loop to handle exceptions.
            navigationItem.leftBarButtonItem!.image = hamburgerIcon
        }
        
        if(navigationItem.rightBarButtonItem != nil){
            //A single check nil if loop to handle exceptions.
            navigationItem.rightBarButtonItem!.image = scoreBoardIcon
        }
        
        
        
    }
    
    
    
    func sideMenu(){
        //Helper function for the sideMenu animation. NOTHING SHOULD BE CHANGED IN THIS FUNCTION.
        
        if (revealViewController() != nil && navigationItem.leftBarButtonItem != nil){
            
            navigationItem.leftBarButtonItem!.target = revealViewController()
            navigationItem.leftBarButtonItem!.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 150
            
            //Pan Gesture here.
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        //Helper function with image resizing.
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}

extension UIView {
    func addBackground(imageName: String = "YOUR DEFAULT IMAGE NAME", contentMode: UIView.ContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}

