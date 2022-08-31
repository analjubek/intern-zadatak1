//
//  MemoryLeakCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class MemoryLeakCoordinator: Coordinator{
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    
    let router: RouterProtocol
    
    var isCompleted: (() -> ())?
    
    lazy var memoryLeakViewController: MemoryLeakViewController = {
        let vc = MemoryLeakViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        let viewController = MemoryLeakViewController()
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}
