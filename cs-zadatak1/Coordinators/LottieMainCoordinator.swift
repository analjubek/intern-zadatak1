//
//  LottieMainCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class LottieMainCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    lazy var lottieMainViewController: LottieMainViewController = {
        let vc = LottieMainViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(lottieMainViewController, animated: true)
    }
}
