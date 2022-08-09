//
//  MainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 09.08.2022..
//

import UIKit
import SnapKit
import SwiftUI

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var txtHorizontalEdge: UITextField!
    @IBOutlet weak var txtVerticalEdge: UITextField!
    
    @IBOutlet weak var btnDraw: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @IBAction func txtInputHorizontalEC(_ sender: Any) {
        print(txtHorizontalEdge.text!)
    }
    
    @IBAction func txtInputVerticalEC(_ sender: Any) {
        print(txtVerticalEdge.text!)
    }
    
    @IBAction func btnDrawTUI(_ sender: Any) {
        print("Evo me")
    }
    
}
