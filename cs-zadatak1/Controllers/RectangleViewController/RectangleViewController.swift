//
//  RectangleViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit

class RectangleViewController: UIViewController {
    
    var rectangle: Rectangle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("horizontal edge: " + String(rectangle!.horizontalEdge))
        print("vertical edge: " + String(rectangle!.verticalEdge))
    }
}
