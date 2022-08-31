//
//  LottieMainViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

class LottieMainViewController: UIViewController {
    var didSelectLottieCoffee: (() -> ())?
    var didSelectLottieDownload: (() -> ())?
    
    var didTapBack: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit{
        print("deinit \(self)")
    }

    @IBAction func btnCoffeeTUI(_ sender: Any) {
        self.didSelectLottieCoffee?()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func btnDownloadTUI(_ sender: Any) {
        self.didSelectLottieDownload?()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
