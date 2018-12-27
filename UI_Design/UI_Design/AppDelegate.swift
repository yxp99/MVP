//
//  AppDelegate.swift
//  UI_Design
//
//  Created by cj on 12/22/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Clear User login information
//        let userDefaults = UserDefaults.standard
//        if userDefaults.value(forKey: "appFirstTimeOpend") == nil {
//            //if app is first time opened then it will be nil
//            userDefaults.setValue(true, forKey: "appFirstTimeOpend")
//            // signOut from FIRAuth
//            do {
//                try Auth.auth().signOut()
//            }catch {
//
//            }
//            // go to beginning of app
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
//            //self.present(newViewController, animated: true, completion: nil)
//            
//            //if newViewController != nil {
//                newViewController.view.frame = (self.window!.frame)
//                self.window!.addSubview(newViewController.view)
//            self.window!.bringSubviewToFront(newViewController.view)
//            //}
//            
//        } else {
//            //go to where you want
//        }
        
        
        //Image Background Navigation Bar
        let navBackgroundImage:UIImage! = UIImage(named: "NavigationBar.png")
        UINavigationBar.appearance().setBackgroundImage(navBackgroundImage, for: .default)
        
        //Firebase Configuration
        FirebaseApp.configure()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

