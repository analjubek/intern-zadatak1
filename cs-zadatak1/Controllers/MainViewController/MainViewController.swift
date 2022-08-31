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
    
    var didSelectRectangles: (() -> ())?
    var didSelectLottie: (() -> ())?
    var didSelectMemoryLeak: (() -> ())?
    
    var didTapBack: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit{
        print("deinit \(self)")
    }
    
    @IBAction func btnRectanglesTUI(_ sender: Any) {
        self.didSelectRectangles?()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnLottieTUI(_ sender: Any) {
        self.didSelectLottie?()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnMemoryLeakTUI(_ sender: Any) {
        self.didSelectMemoryLeak?()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
