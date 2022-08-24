//
//  MainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnRectanglesTUI(_ sender: Any) {
        let coordinator = MainRectangleCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnLottieTUI(_ sender: Any) {
        let coordinator = LottieMainCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnMemoryLeakTUI(_ sender: Any) {
        let coordinator = MemoryLeakCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
