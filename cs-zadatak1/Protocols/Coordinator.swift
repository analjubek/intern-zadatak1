//
//  Coordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    //var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator]{ get set }
    func start()
}

extension Coordinator {

    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator?) {
        guard let coordinator = coordinator else {
            return
        }
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
