//
//  AppDelegate.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 08.08.2022..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var initialViewController: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)

        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        return true
        
        /*let rootViewController = MainViewController()
         let navigationController = UINavigationController(rootViewController: rootViewController)
         self.window = UIWindow(frame: UIScreen.main.bounds)
         self.window?.rootViewController = navigationController
         self.window?.makeKeyAndVisible()

         return true*/
        
        /*
        // if self.window is nil then set a new UIWindow object to self.window.
        self.window = self.window ?? UIWindow()
       
        // Set self.window's background color to red.
        self.window!.backgroundColor = UIColor.red
   
        // Create a ViewController object and set it as self.window's root view controller.
        self.window!.rootViewController = MainViewController()
   
        // Make the window be visible.
        self.window!.makeKeyAndVisible()
        
        return true*/
    }

    // MARK: UISceneSession Lifecycle
/*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
*/

}

