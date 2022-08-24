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
    
    // lazy stored property
    // lazy var = just-in-time calculation of expensive work
    lazy var lottieDownloadViewController: LottieDownloadViewController = {
        let vc = LottieDownloadViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    // These variables are created using a function you specify only when that variable is FIRST requested. If it's never requested, the function is never run, so it does help save processing time. -> stvara se samo ako je pozvana, jednom
    
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(lottieDownloadViewController, animated: true)
    }
}
