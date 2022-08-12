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
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        let appNavC = UINavigationController()
        self.window!.rootViewController = appNavC

        self.window!.makeKeyAndVisible()
        
        let appCoordinator = AppCoordinator(navigationController: appNavC)
        appCoordinator.start()
        appCoordinator.childCoordinators.append(appCoordinator)
        
        return true
    }
}

// inicijalizirati main nav controller u AppDelegateu
// kreirati koordinator, unutar AppDelegatea pozvati i proslijediti nav controller
// u impl nav controllera pozvati main view controller

