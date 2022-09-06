//
//  AppCoordinator.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 30.08.2022..
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start() {
        let router = Router(navigationController: UINavigationController())
        let mainViewCoordinator = MainViewCoordinator(router: router)

        self.start(coordinator: mainViewCoordinator)

        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
    }
}
