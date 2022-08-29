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
    
    lazy var mainViewController: MainViewController = {
        let vc = MainViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    deinit{
        print ("MainViewCoordinator deinitialized")
    }
    
    func start() {
        mainViewController.delegate = self
        navigationController.pushViewController(mainViewController, animated: true)
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

extension MainViewCoordinator: MainViewControllerDelegate {
    func rectanglesButtonSelected() {
        let mainRectangleCoordinator = MainRectangleCoordinator(navigationController: navigationController)
        mainRectangleCoordinator.parentCoordinator = self
        mainRectangleCoordinator.start()
        childCoordinators.append(mainRectangleCoordinator)
    }
    
    func lottieButtonSelected() {
        let lottieMainCoordinator = LottieMainCoordinator(navigationController: navigationController)
        lottieMainCoordinator.parentCoordinator = self
        lottieMainCoordinator.start()
        childCoordinators.append(lottieMainCoordinator)
    }
    
    func memoryLeakButtonSelected() {
        let memoryLeakCoordinator = MemoryLeakCoordinator(navigationController: navigationController)
        memoryLeakCoordinator.start()
    }
}
