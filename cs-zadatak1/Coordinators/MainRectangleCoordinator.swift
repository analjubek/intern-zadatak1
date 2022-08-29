//
//  MainRectangleCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class MainRectangleCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: MainViewCoordinator?
    
    lazy var mainRectangleViewController: MainRectangleViewController = {
        let vc = MainRectangleViewController.fromNib(bundle: Bundle.main)
        return vc
    }()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        mainRectangleViewController.delegate = self
        navigationController.pushViewController(mainRectangleViewController, animated: true)
    }
    
    func didControllerClosed() {
        parentCoordinator?.childDidFinish(self)
    }
}

extension MainRectangleCoordinator: MainRectangleViewControllerDelegate{
    func drawButtonSelected(horizontalEdge: Int, verticalEdge: Int) {
        let rectangleCoordinator = RectangleCoordinator(navigationController: navigationController, horizontalEdge: horizontalEdge, verticalEdge: verticalEdge)
        rectangleCoordinator.start()
    }
}
