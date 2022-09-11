//
//  AppDelegate.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 13/02/1444 AH.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        
        setupRootViewController()
        return true
    }

   
    
    func setupRootViewController() {
        
        
        let rootVC =  LandingPageVC.initializeWithNavigationController()
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }
    


}

