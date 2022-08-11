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
    private var appCoordinator: AppCoordinator?  // 1
    
    /*private lazy var appCoordinator: AppCoordinator = {
        return AppCoordinator(in: self.window!)
    }()*/
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
            let appCoordinator = AppCoordinator(window: window) // 2
            
            self.window = window
            self.appCoordinator = appCoordinator
            
            appCoordinator.start()  // 3
            return true
    }
    /*
    var initialViewController: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)

        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        return true
    }*/
}

