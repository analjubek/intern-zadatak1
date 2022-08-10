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
    
    @IBOutlet weak var lblWrongHorizontalEdge: UILabel!
    @IBOutlet weak var lblWrongVerticalEdge: UILabel!
    
    @IBOutlet weak var btnDraw: UIButton!
    
    private var bolHorizontal: Bool!
    private var bolVertical: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        hideWarnings()
        setupBol()
        disableButton()
    }
    
    func setupBol(){
        bolHorizontal = false
        bolVertical = false
    }
    
    func shouldEnableButton(){
        if (bolHorizontal && bolVertical){
            enableButton()
        }
    }
    
    func enableButton(){
        btnDraw.isEnabled = true
        btnDraw.alpha = 1.0
    }
    
    func disableButton(){
        btnDraw.isEnabled = false
        btnDraw.alpha = 0.5
    }
    
    func hideWarnings() {
        lblWrongHorizontalEdge.isHidden = true
        lblWrongVerticalEdge.isHidden = true
    }
    
    @IBAction func txtInputHorizontalEC(_ sender: UITextField) {
        let horizontalInput = txtHorizontalEdge.text!
        print(horizontalInput)
        
        if(isIntegerNumber(horizontalInput)){
            print("broj")
            lblWrongHorizontalEdge.isHidden = true
            bolHorizontal = true
            shouldEnableButton()
            
            let horizontalInputInt = Int(horizontalInput)
            if(horizontalInputInt! <= 0){
                print("nula ili manje")
                lblWrongHorizontalEdge.isHidden = false
                bolHorizontal = false
                disableButton()
            }
        }
        else if (horizontalInput.isEmpty){
            print("prazno")
            lblWrongHorizontalEdge.isHidden = true
            bolHorizontal = false
            disableButton()
        }
        else{
            print("nije broj")
            lblWrongHorizontalEdge.isHidden = false
            bolHorizontal = false
            disableButton()
        }
    }
    
    @IBAction func txtInputVerticalEC(_ sender: UITextField) {
        let verticalInput = txtVerticalEdge.text!
        print(verticalInput)
        
        if(isIntegerNumber(verticalInput)){
            print("broj")
            lblWrongVerticalEdge.isHidden = true
            bolVertical = true
            shouldEnableButton()
            
            let verticalInputInt = Int(verticalInput)
            if(verticalInputInt! <= 0){
                print("nula ili manje")
                lblWrongVerticalEdge.isHidden = false
                bolVertical = false
                disableButton()
            }
        }
        else if (verticalInput.isEmpty){
            print("prazno")
            lblWrongVerticalEdge.isHidden = true
            lblWrongHorizontalEdge.isHidden = true
            bolVertical = false
            disableButton()
        }
        else{
            print("nije broj")
            lblWrongVerticalEdge.isHidden = false
            bolVertical = false
            disableButton()
        }
    }
    
    @IBAction func btnDrawTUI(_ sender: Any) {
        print("Evo me")
    }
    
    func isIntegerNumber(_ text: String) -> Bool{
        if let intVal = Int(text){
            return true
        }
        else{
            return false
        }
    }
    
}
