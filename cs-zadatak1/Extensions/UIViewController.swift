//
//  UIViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit

extension UIViewController{
    class func fromNib(bundle: Bundle) -> Self {
            return self.init(nibName: String(describing: self), bundle: bundle)
    }
}
