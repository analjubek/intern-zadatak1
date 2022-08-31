//
//  Drawable.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 30.08.2022..
//

import UIKit

protocol Drawable {
    var viewController: UIViewController? { get }
}

extension UIViewController: Drawable {
    var viewController: UIViewController? { return self }
}
