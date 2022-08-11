//
//  AppCoordinatorProtocol.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

//  www.raywenderlich.com/158-coordinator-tutorial-for-ios-getting-started#toc-anchor-004

import Foundation
import UIKit

public protocol AppCoordinatorProtocol: AnyObject {
    //var navigationController: UINavigationController { get set }
    func start()
}
