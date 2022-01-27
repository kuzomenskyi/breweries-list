//
//  AppDelegate.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Constant
    
    // MARK: Variable
    var window: UIWindow?
    
    // MARK: Function
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let homeScreen = Splash().view
            
            window?.rootViewController = homeScreen
            window?.makeKeyAndVisible()
        }
        return true
    }
}

