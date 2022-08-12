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
    
    // lazy stored property
    // lazy var = just-in-time calculation of expensive work
    lazy var rectangleViewController: RectangleViewController = {
        let vc = RectangleViewController.fromNib(bundle: Bundle.main)
        vc.rectangle = Rectangle(horizontalEdge: horizontalEdge, verticalEdge: verticalEdge) // šaljemo vrijednosti rectangleu rectangleViewControllera
        return vc
    }()
    // These variables are created using a function you specify only when that variable is FIRST requested. If it's never requested, the function is never run, so it does help save processing time. -> stvara se samo ako je pozvana, jednom
    
    
    init(navigationController: UINavigationController, horizontalEdge: Int, verticalEdge: Int){
        self.navigationController = navigationController
        self.horizontalEdge = horizontalEdge
        self.verticalEdge = verticalEdge
    }
    
    func start() {
        navigationController.pushViewController(rectangleViewController, animated: true)
    }
    
    //lazy var koja se inicijalizira u startu viewController, u startu ga pushati na navigation controller
    
    //pritiskom na button inicijaliziramo ovaj koordinator
}


//NAVIGATION CONTROLLER
