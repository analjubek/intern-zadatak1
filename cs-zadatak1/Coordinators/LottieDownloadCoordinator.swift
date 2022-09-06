//
//  LottieDownloadCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 23.08.2022..
//

import Foundation
import UIKit

class LottieDownloadCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    let router: RouterProtocol
    var isCompleted: (() -> ())?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        lazy var  viewController = LottieDownloadViewController()
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}
