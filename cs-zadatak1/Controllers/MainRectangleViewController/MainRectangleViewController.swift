//
//  MainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 09.08.2022..
//

import UIKit
import SnapKit
import SwiftUI

class MainRectangleViewController: UIViewController {
    var didSelectRectangle: ((_ horizontalEdge: Int, _ verticalEdge: Int) -> ())?

    weak var coordinator: MainRectangleCoordinator?
    
    @IBOutlet weak var txtHorizontalEdge: UITextField!
    @IBOutlet weak var txtVerticalEdge: UITextField!
    
    var horizontalInputInt: Int?
    var verticalInputInt: Int?
    
    @IBOutlet weak var lblWrongHorizontalEdge: UILabel!
    @IBOutlet weak var lblWrongVerticalEdge: UILabel!
    
    @IBOutlet weak var btnDraw: UIButton!
    @IBOutlet weak var btnLottieCoffee: UIButton!
    @IBOutlet weak var btnLottieDownload: UIButton!
    
    private var bolHorizontal: Bool!
    private var bolVertical: Bool!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        hideWarnings()
        setupBol()
        disableButton()
    }
    
    deinit{
        print("deinit \(self)")
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
    
    
    func setRightInputFlag(_ isRight: Bool, edge: String) {
        if (edge == "horizontal"){
            bolHorizontal = isRight
        }
        if (edge == "vertical"){
            bolVertical = isRight
        }
    }
    
    func isInputRightInteger(input: String, edge: String) -> Bool{
        if isIntegerNumber(input) {
            if (edge == "horizontal"){
                horizontalInputInt = Int(input)!
                return (horizontalInputInt! <= 0 || horizontalInputInt! > 10) ? false : true
            }
            if (edge == "vertical"){
                verticalInputInt = Int(input)!
                return (verticalInputInt! <= 0 || verticalInputInt! > 10) ? false : true
            }
        }
        return false
    }
    
    func hideWarning(_ hideWarning: Bool, edge: String){
        if (edge == "horizontal"){
            lblWrongHorizontalEdge.isHidden = hideWarning
        }
        if (edge == "vertical"){
            lblWrongVerticalEdge.isHidden = hideWarning
        }
    }
    
    func inputSetup(rightInput: Bool, warningHidden: Bool, edge: String){
        setRightInputFlag(rightInput, edge: edge)
        hideWarning(warningHidden, edge: edge)
    }
    
    @IBAction func txtInputHorizontalEC(_ sender: UITextField) {
        let horizontalInput = txtHorizontalEdge.text!
        let edge = "horizontal"
        
        if(isInputRightInteger(input: horizontalInput, edge: edge)){
            inputSetup(rightInput: true, warningHidden: true, edge: edge)
            shouldEnableButton()
        }
        else if horizontalInput.isEmpty{
            inputSetup(rightInput: false, warningHidden: true, edge: edge)
            disableButton()
        }
        else{
            inputSetup(rightInput: false, warningHidden: false, edge: edge)
            disableButton()
        }
    }
    
    @IBAction func txtInputVerticalEC(_ sender: UITextField) {
        let verticalInput = txtVerticalEdge.text!
        let edge = "vertical"
        
        if(isInputRightInteger(input: verticalInput, edge: edge)){
            inputSetup(rightInput: true, warningHidden: true, edge: edge)
            shouldEnableButton()
        }
        else if verticalInput.isEmpty{
            inputSetup(rightInput: false, warningHidden: true, edge: edge)
            disableButton()
        }
        else{
            inputSetup(rightInput: false, warningHidden: false, edge: edge)
            disableButton()
        }
    }
    
    @IBAction func btnDrawTUI(_ sender: UIButton) {
        self.didSelectRectangle?(self.horizontalInputInt!, self.verticalInputInt!)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func isIntegerNumber(_ text: String) -> Bool{
        return (Int(text) != nil) ? true : false
    }
    
}
