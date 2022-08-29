//
//  AppDelegate.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 08.08.2022..
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var initialCoordinator: MainViewCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SingletonData.shared.start()
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
    
        let appNavC = UINavigationController()
        self.window!.rootViewController = appNavC
        self.window!.makeKeyAndVisible()
        
        initialCoordinator = MainViewCoordinator(navigationController: appNavC)
        initialCoordinator?.start()
        
        return true
    }
}
