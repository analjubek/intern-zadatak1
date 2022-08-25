//
//  LottieMainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

protocol LottieMainViewControllerDelegate: class {
    func coffeeButtonSelected()
    func downloadButtonSelected()
}

class LottieMainViewController: UIViewController {
    weak var delegate: LottieMainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnCoffeeTUI(_ sender: Any) {
        delegate?.coffeeButtonSelected()
        //coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnDownloadTUI(_ sender: Any) {
        delegate?.downloadButtonSelected()
        //coordinator.childCoordinators.append(coordinator)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
