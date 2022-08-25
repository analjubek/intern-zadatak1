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
    
    private var lottieCoffeeCoordinator: LottieCoffeeCoordinator?
    private var lottieDownloadCoordinator: LottieDownloadCoordinator?
    
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
}

extension LottieMainCoordinator: LottieMainViewControllerDelegate {
    func coffeeButtonSelected(){
        let lottieCoffeeCoordinator = LottieCoffeeCoordinator(navigationController: navigationController)
        
        lottieCoffeeCoordinator.start()

        self.lottieCoffeeCoordinator = lottieCoffeeCoordinator
        
        childCoordinators.append(lottieCoffeeCoordinator)
    }
    func downloadButtonSelected(){
        let lottieDownloadCoordinator = LottieDownloadCoordinator(navigationController: navigationController)
        
        lottieDownloadCoordinator.start()

        self.lottieDownloadCoordinator = lottieDownloadCoordinator
        
        childCoordinators.append(lottieDownloadCoordinator)
    }
}
