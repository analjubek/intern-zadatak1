//
//  LottieDownloadCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 23.08.2022..
//

import Foundation
import UIKit

class LottieDownloadCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: LottieMainCoordinator?
    
    lazy var lottieDownloadViewController: LottieDownloadViewController = {
        let vc = LottieDownloadViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    deinit{
        print("Deinti lotttie download")
    }    
    
    func start() {
        navigationController.pushViewController(lottieDownloadViewController, animated: true)
    }
    
    func didControllerClosed() {
        parentCoordinator?.childDidFinish(self)
    }
}
