//
//  LottieMainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

protocol LottieMainViewControllerDelegate: AnyObject {
    func coffeeButtonSelected()
    func downloadButtonSelected()
}

class LottieMainViewController: UIViewController {
    weak var coordinator: LottieMainCoordinator?
    
    weak var delegate: LottieMainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didControllerClosed()
    }

    @IBAction func btnCoffeeTUI(_ sender: Any) {
        delegate?.coffeeButtonSelected()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnDownloadTUI(_ sender: Any) {
        delegate?.downloadButtonSelected()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
