//
//  AppDelegate.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 08.08.2022..
//

import UIKit
import LeakedViewControllerDetector


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator : AppCoordinator!
    //var initialCoordinator: MainViewCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SingletonData.shared.start()
        
        /*let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
    
        let appNavC = UINavigationController()
        self.window!.rootViewController = appNavC
        self.window!.makeKeyAndVisible()
        
        initialCoordinator = MainViewCoordinator(navigationController: appNavC)
        initialCoordinator?.start()*/
        
        window = UIWindow()

        let appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        self.appCoordinator = appCoordinator
        
        LeakedViewControllerDetector.onDetect() { leakedViewController, leakedView, message in
            #if DEBUG
            return true //show warning alert dialog
            #else
            //log warning message to a server, e.g. Crashlytics
            return false //don't show warning to user
            #endif
        }
        
        return true
    }
}
