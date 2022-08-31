//
//  LottieCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 22.08.2022..
//

import Foundation
import UIKit

class LottieCoffeeCoordinator: Coordinator{
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    
    let router: RouterProtocol
    
    var isCompleted: (() -> ())?
    
    weak var parentCoordinator: LottieMainCoordinator?
    
    lazy var lottieCoffeeViewController: LottieCoffeeViewController = {
        let vc = LottieCoffeeViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        let viewController = LottieCoffeeViewController()
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}
