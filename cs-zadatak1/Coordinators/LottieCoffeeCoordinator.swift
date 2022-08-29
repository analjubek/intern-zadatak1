//
//  LottieCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 22.08.2022..
//

import Foundation
import UIKit

class LottieCoffeeCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: LottieMainCoordinator?
    
    lazy var lottieCoffeeViewController: LottieCoffeeViewController = {
        let vc = LottieCoffeeViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(lottieCoffeeViewController, animated: true)
    }
    
    func didControllerClosed() {
        parentCoordinator?.childDidFinish(self)
    }
}
