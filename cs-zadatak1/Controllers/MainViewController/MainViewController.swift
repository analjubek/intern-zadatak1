//
//  MainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func rectanglesButtonSelected()
    func lottieButtonSelected()
    func memoryLeakButtonSelected()
}

class MainViewController: UIViewController {
    weak var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnRectanglesTUI(_ sender: Any) {
        delegate?.rectanglesButtonSelected()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnLottieTUI(_ sender: Any) {
        delegate?.lottieButtonSelected()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnMemoryLeakTUI(_ sender: Any) {
        delegate?.memoryLeakButtonSelected()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
