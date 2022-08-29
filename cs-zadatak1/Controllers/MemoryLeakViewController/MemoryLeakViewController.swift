//
//  MemoryLeakViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 24.08.2022..
//

import UIKit

class MemoryLeakViewController: UIViewController {
    var memoryLeakView: MemoryLeakView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoryLeakView = MemoryLeakView(vc: self)
    }
}

class MemoryLeakView: UIView {
    weak var vc: UIViewController?
    
    init(vc: UIViewController){
        self.vc = vc
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

