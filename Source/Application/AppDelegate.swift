//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = UIColor(red:1.00, green:0.00, blue:0.15, alpha:1.00)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        
        return true
    }
}

