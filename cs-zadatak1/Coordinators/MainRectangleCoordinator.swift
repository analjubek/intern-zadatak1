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
        viewController.didSelectRectangle = { [weak self] horizontalEdge, verticalEdge in
            guard let strongSelf = self else { return }
            strongSelf.showRectangleView(in: strongSelf.router, horizontalEdge: horizontalEdge, verticalEdge: verticalEdge)
        }
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
    
    func showRectangleView(in router: RouterProtocol, horizontalEdge: Int, verticalEdge: Int) {
        let rectangleCoordinator = RectangleCoordinator(router: router, horizontalEdge: horizontalEdge, verticalEdge: verticalEdge)
        rectangleCoordinator.start()
        self.store(coordinator: rectangleCoordinator)
    }
}

