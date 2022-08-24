//
//  MemoryLeakCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class MemoryLeakCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    lazy var memoryLeakViewController: MemoryLeakViewController = {
        let vc = MemoryLeakViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(memoryLeakViewController, animated: true)
    }
}
