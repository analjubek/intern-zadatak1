//
//  AppCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 12.08.2022..
//

import Foundation
import UIKit

class AppCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    lazy var mainViewController: MainViewController = {
        let vc = MainViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(mainViewController, animated: true)
    }
}
