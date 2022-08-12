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
        
        initialViewController = MainViewController.fromNib(bundle: Bundle.main)

        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)

        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        return true
    }
}

// inicijalizirati main nav controller u AppDelegateu
// kreirati koordinator, unutar AppDelegatea pozvati i proslijediti nav controller
// u impl nav controllera pozvati main view controller

