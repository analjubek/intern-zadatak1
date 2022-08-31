//
//  BaseCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 30.08.2022..
//

import UIKit
import Foundation

class BaseCoordinator : Coordinator {
    var childCoordinators : [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
    
    func start(coordinator: BaseCoordinator) {
        self.store(coordinator: coordinator)
        coordinator.isCompleted = { [weak self, weak coordinator] in
            self?.free(coordinator: coordinator)
        }
        coordinator.start()
    }
}
