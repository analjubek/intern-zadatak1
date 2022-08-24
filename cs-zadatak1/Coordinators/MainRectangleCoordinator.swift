//
//  MainRectangleCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class MainRectangleCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    lazy var mainRectangleViewController: MainRectangleViewController = {
        let vc = MainRectangleViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(mainRectangleViewController, animated: true)
    }
}
