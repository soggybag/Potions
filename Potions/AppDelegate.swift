//
//  AppDelegate.swift
//  Potions
//
//  Created by mitchell hudson on 12/21/14.
//  Copyright (c) 2014 mitchell hudson. All rights reserved.
//

// TODO: Add textStyle support for resizing type from System

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // let attributes = [NSFontAttributeName:UIFont(name: "Times", size: 16)]
        
        // UILabel.appearance().setTitleTextAttributes(attributes, forState: UIControlState.Normal)
        
        /*
        for family in UIFont.familyNames() as Array {
            println("Family: \(family)")
            for name in UIFont.fontNamesForFamilyName(family as String) {
                println("\(name)")
            }
        }
        
        
        Family: Roboto Slab
        RobotoSlab-Bold
        RobotoSlab-Light
        RobotoSlab-Thin
        */
        
        UILabel.appearance().font = UIFont(name: "RobotoSlab-Light", size: 16)
        UITextView.appearance().font = UIFont(name: "RobotoSlab-Light", size: 16)
        
        let color_a = UIColor(red: 202/255, green: 191/255, blue: 173/255, alpha: 1.0)
        let color_b = UIColor(red: 251/255, green: 247/255, blue: 240/255, alpha: 1.0)
        let color_c = UIColor(red:   2/255, green: 152/255, blue: 193/255, alpha: 1.0)
        let color_d = UIColor(red: 167/255, green:  80/255, blue:  84/255, alpha: 1.0)
        let color_e = UIColor(red: 239/255, green: 232/255, blue: 224/255, alpha: 1.0)
        
        UINavigationBar.appearance().backgroundColor = color_a
        // UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barTintColor = color_a
        
        // let titleAttributes: [String:AnyObject] = [NSForegroundColorAttributeName:color_d, NSFontAttributeName:UIFont(name: "RobotoSlab-Light", size: 24)]
        // UINavigationBar.appearance().titleTextAttributes = titleAttributes
        
        UITableView.appearance().backgroundColor = color_a
        UITableViewCell.appearance().backgroundColor = color_b
        UITableViewHeaderFooterView.appearance().backgroundColor = color_a
        UITableView.appearance().backgroundView?.backgroundColor = color_c
        
        // UITableViewCell.appearance().selectionStyle =
        
        UITextView.appearance().backgroundColor = UIColor.clearColor()
        
        window?.tintColor = color_d
        window?.backgroundColor = color_a
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

