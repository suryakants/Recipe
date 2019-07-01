//
//  AppDelegate.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //start nerwork reachabiliy test
        ReachabilityManager.sharedInstance.allocRechability();
        
        //setup window
        window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator()
        appCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
}

