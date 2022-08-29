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
    
    weak var parentCoordinator: MainViewCoordinator?
    
    lazy var lottieMainViewController: LottieMainViewController = {
        let vc = LottieMainViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        lottieMainViewController.delegate = self
        navigationController.pushViewController(lottieMainViewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated(){
            if (coordinator === child) {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func didControllerClosed() {
        parentCoordinator?.childDidFinish(self)
    }
}

extension LottieMainCoordinator: LottieMainViewControllerDelegate {
    func coffeeButtonSelected(){
        let lottieCoffeeCoordinator = LottieCoffeeCoordinator(navigationController: navigationController)
        lottieCoffeeCoordinator.parentCoordinator = self
        lottieCoffeeCoordinator.start()
    }
    func downloadButtonSelected(){
        let lottieDownloadCoordinator = LottieDownloadCoordinator(navigationController: navigationController)
        lottieDownloadCoordinator.parentCoordinator = self
        lottieDownloadCoordinator.start()
    }
}
