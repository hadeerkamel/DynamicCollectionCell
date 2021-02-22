//
//  AppDelegate.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }

    func setRootViewController(){
        DispatchQueue.main.async {
            self.window = UIWindow(frame:UIScreen.main.bounds)
            self.window?.rootViewController = ProductsVC()
            self.window?.makeKeyAndVisible()
        }
    }
}

