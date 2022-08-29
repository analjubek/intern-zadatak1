//
//  RectangleCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//


import Foundation
import UIKit

class RectangleCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    var horizontalEdge: Int
    var verticalEdge: Int
    
    lazy var rectangleViewController: RectangleViewController = {
        let vc = RectangleViewController.fromNib(bundle: Bundle.main)
        vc.rectangle = Rectangle(horizontalEdge: horizontalEdge, verticalEdge: verticalEdge) 
        return vc
    }()
    
    
    init(navigationController: UINavigationController, horizontalEdge: Int, verticalEdge: Int){
        self.navigationController = navigationController
        self.horizontalEdge = horizontalEdge
        self.verticalEdge = verticalEdge
    }
    
    func start() {
        navigationController.pushViewController(rectangleViewController, animated: true)
    }
}
