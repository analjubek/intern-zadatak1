//
//  AppCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 12.08.2022..
//

import Foundation
import UIKit

class MainViewCoordinator: BaseCoordinator{
    let router: RouterProtocol

    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        let viewController = MainViewController()
        
        viewController.didSelectRectangles = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showMainRectanglesView(in: strongSelf.router)
        }
        viewController.didSelectLottie = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showLottieMainView(in: strongSelf.router)
        }
        viewController.didSelectMemoryLeak = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showMemoryLeakView(in: strongSelf.router)
        }
            router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }

    func showMainRectanglesView(in router: RouterProtocol) {
        let mainRectangleCoordinator = MainRectangleCoordinator(router: router)
        mainRectangleCoordinator.start()
        self.store(coordinator: mainRectangleCoordinator)
    }
    func showLottieMainView(in router: RouterProtocol) {
        let lottieMainCoordinator = LottieMainCoordinator(router: router)
        lottieMainCoordinator.start()
        self.store(coordinator: lottieMainCoordinator)
    }
    func showMemoryLeakView(in router: RouterProtocol) {
        let memoryLeakCoordinator = MemoryLeakCoordinator(router: router)
        memoryLeakCoordinator.start()
        self.store(coordinator: memoryLeakCoordinator)
    }
    
    func childDidFinish(_ child: Coordinator?) {
            for (index, coordinator) in childCoordinators.enumerated(){
                if (coordinator === child) {
                    childCoordinators.remove(at: index)
                    break
                }
            }
        }
}
