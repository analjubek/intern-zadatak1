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
    
    @IBAction func txtInputHorizontalEC(_ sender: UITextField) {
        let horizontalInput = txtHorizontalEdge.text!
        print(horizontalInput)
        if(isNumber(horizontalInput) || horizontalInput.isEmpty){
            print("broj ili prazno")
        }
        else{
            print("nije broj")
        }
    }
    
    @IBAction func txtInputVerticalEC(_ sender: UITextField) {
        let verticalInput = txtVerticalEdge.text!
        print(verticalInput)
        if(isNumber(verticalInput) || verticalInput.isEmpty){
            print("broj ili prazno")
        }
        else{
            print("nije broj")
        }
    }
    
    @IBAction func btnDrawTUI(_ sender: Any) {
        print("Evo me")
    }
    
    func isNumber(_ text: String) -> Bool{
        if let intVal = Int(text){
            return true
        }
        else{
            return false
        }
    }
    
}
