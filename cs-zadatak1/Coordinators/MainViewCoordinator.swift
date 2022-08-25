//
//  AppCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 12.08.2022..
//

import Foundation
import UIKit

class MainViewCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    private var mainRectangleCoordinator: MainRectangleCoordinator?
    private var lottieMainCoordinator: LottieMainCoordinator?
    private var memoryLeakCoordinator: MemoryLeakCoordinator?
    
    lazy var mainViewController: MainViewController = {
        let vc = MainViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        mainViewController.delegate = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
}

extension MainViewCoordinator: MainViewControllerDelegate {
    func rectanglesButtonSelected() {
        let mainRectangleCoordinator = MainRectangleCoordinator(navigationController: navigationController)
        
        mainRectangleCoordinator.start()

        self.mainRectangleCoordinator = mainRectangleCoordinator
        
        childCoordinators.append(mainRectangleCoordinator)
    }
    
    func lottieButtonSelected() {
        let lottieMainCoordinator = LottieMainCoordinator(navigationController: navigationController)
        
        lottieMainCoordinator.start()

        self.lottieMainCoordinator = lottieMainCoordinator
        
        childCoordinators.append(lottieMainCoordinator)
    }
    
    func memoryLeakButtonSelected() {
        let memoryLeakCoordinator = MemoryLeakCoordinator(navigationController: navigationController)
        
        memoryLeakCoordinator.start()

        self.memoryLeakCoordinator = memoryLeakCoordinator
        
        childCoordinators.append(memoryLeakCoordinator)
    }
}
