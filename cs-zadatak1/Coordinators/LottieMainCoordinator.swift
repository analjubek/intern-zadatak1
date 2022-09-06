//
//  LottieMainCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class LottieMainCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    let router: RouterProtocol
    var isCompleted: (() -> ())?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        lazy var viewController = LottieMainViewController()
        
        viewController.didSelectLottieCoffee = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showLottieCoffeeView(in: strongSelf.router)
        }
        viewController.didSelectLottieDownload = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showLottieDownloadView(in: strongSelf.router)
        }
        
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
    
    func showLottieCoffeeView(in router: RouterProtocol) {
        let lottieCoffeeCoordinator = LottieCoffeeCoordinator(router: router)
        lottieCoffeeCoordinator.start()
        self.store(coordinator: lottieCoffeeCoordinator)
    }
    func showLottieDownloadView(in router: RouterProtocol) {
        let lottieDownloadCoordinator = LottieDownloadCoordinator(router: router)
        lottieDownloadCoordinator.start()
        self.store(coordinator: lottieDownloadCoordinator)
    }
    
}
