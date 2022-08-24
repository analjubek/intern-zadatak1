//
//  LottieMainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

class LottieMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnCoffeeTUI(_ sender: Any) {
        let coordinator = LottieCoffeeCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnDownloadTUI(_ sender: Any) {
        let coordinator = LottieDownloadCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        //coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
