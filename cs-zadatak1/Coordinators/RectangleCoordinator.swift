//
//  RectangleCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//


import Foundation
import UIKit

class RectangleCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    let router: RouterProtocol
    var isCompleted: (() -> ())?
    
    var horizontalEdge: Int
    var verticalEdge: Int
    
    init(router: RouterProtocol, horizontalEdge: Int, verticalEdge: Int){
        self.router = router
        self.horizontalEdge = horizontalEdge
        self.verticalEdge = verticalEdge
    }
    
    func start() {
        lazy var viewController = RectangleViewController()
        viewController.rectangle = Rectangle(horizontalEdge: horizontalEdge, verticalEdge: verticalEdge)
        router.push(viewController, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}
