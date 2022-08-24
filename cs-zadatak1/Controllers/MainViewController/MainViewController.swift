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
    
    var horizontalInputInt = 1
    var verticalInputInt = 1
    
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
        
        if(isIntegerNumber(horizontalInput)){
            lblWrongHorizontalEdge.isHidden = true
            bolHorizontal = true
            shouldEnableButton()
            
            horizontalInputInt = Int(horizontalInput)!
            if(horizontalInputInt <= 0 || horizontalInputInt > 10){
                lblWrongHorizontalEdge.isHidden = false
                bolHorizontal = false
                disableButton()
            }
        }
        else if (horizontalInput.isEmpty){
            lblWrongHorizontalEdge.isHidden = true
            bolHorizontal = false
            disableButton()
        }
        else{
            lblWrongHorizontalEdge.isHidden = false
            bolHorizontal = false
            disableButton()
        }
    }
    
    @IBAction func txtInputVerticalEC(_ sender: UITextField) {
        let verticalInput = txtVerticalEdge.text!
        
        if(isIntegerNumber(verticalInput)){
            lblWrongVerticalEdge.isHidden = true
            bolVertical = true
            shouldEnableButton()
            
            verticalInputInt = Int(verticalInput)!
            if(verticalInputInt <= 0 || verticalInputInt > 10){
                lblWrongVerticalEdge.isHidden = false
                bolVertical = false
                disableButton()
            }
        }
        else if (verticalInput.isEmpty){
            lblWrongVerticalEdge.isHidden = true
            lblWrongVerticalEdge.isHidden = true
            bolVertical = false
            disableButton()
        }
        else{
            lblWrongVerticalEdge.isHidden = false
            bolVertical = false
            disableButton()
        }
    }
    
    @IBAction func btnDrawTUI(_ sender: UIButton) {

        let coordinator = RectangleCoordinator(navigationController: self.navigationController!, horizontalEdge: horizontalInputInt, verticalEdge: verticalInputInt)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func btnLottieCoffeeTUI(_ sender: Any) {
        let coordinator = LottieCoffeeCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func btnLottieDownloadTUI(_ sender: Any) {
        let coordinator = LottieDownloadCoordinator(navigationController: self.navigationController!)
        coordinator.start()
        coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
