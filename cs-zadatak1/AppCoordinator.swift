//
//  AppCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    //let kanjiStorage: KanjiStorage //  1
    let window: UIWindow  // 2
    let rootViewController: UINavigationController  // 3
    var mainViewController: MainViewController
  
  init(window: UIWindow) { //4
    self.window = window
    //kanjiStorage = KanjiStorage()
    rootViewController = UINavigationController()
    
    // Code below is for testing purposes   // 5
    //let emptyViewController = UIViewController()
    //emptyViewController.view.backgroundColor = .cyan
    mainViewController = MainViewController()
    rootViewController.pushViewController(mainViewController, animated: false)
  }
  
  func start() {  // 6
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
}

/*class AppCoordinator: AppCoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let mainViewController: MainViewController = MainViewController()
        //self.navigationController.pushViewController(secondViewController, animated: true)
    }
}*/
/*
extension AppCoordinator: SecondViewControllerDelegate {
    
    // Navigate to third page
    func navigateToThirdPage() {
        let thirdViewController : ThirdViewController = ThirdViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    // Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}*/
