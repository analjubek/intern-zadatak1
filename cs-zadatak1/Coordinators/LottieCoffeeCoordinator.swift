//
//  LottieCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 22.08.2022..
//

import Foundation
import UIKit

class LottieCoffeeCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    let router: RouterProtocol
    
    var isCompleted: (() -> ())?
    
    weak var parentCoordinator: LottieMainCoordinator?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        lazy var viewController = LottieCoffeeViewController()
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}
