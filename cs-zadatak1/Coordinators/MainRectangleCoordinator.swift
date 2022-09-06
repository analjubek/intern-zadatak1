//
//  MainRectangleCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import Foundation
import UIKit

class MainRectangleCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    let router: RouterProtocol
    var isCompleted: (() -> ())?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        lazy var viewController = MainRectangleViewController()
        viewController.delegate = self
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}

extension MainRectangleCoordinator: MainRectangleViewControllerDelegate{
    func makeRectangles(horizontalInput: Int, verticalInput: Int) {
        let strongSelf = self 
        let rectangleCoordinator = RectangleCoordinator(router: strongSelf.router, horizontalEdge: horizontalInput, verticalEdge: verticalInput)
        rectangleCoordinator.start()
        self.store(coordinator: rectangleCoordinator)
    }
}
