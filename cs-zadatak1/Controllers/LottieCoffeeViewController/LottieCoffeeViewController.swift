//
//  LottieViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 23.08.2022..
//

import UIKit
import Lottie

class LottieCoffeeViewController: UIViewController {
    
    @IBOutlet weak var viwSafeArea: UIView!
    
    // Lottie view
    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ime je uvijek jednaku nazivu animacije bez ekstenzije
        animationView = .init(name: "coffee")
        animationView?.frame = viwSafeArea.bounds
        viwSafeArea.addSubview(animationView!)
        
        // uključivanje animacije
        animationView?.play()
        // ponavljanje animacije
        animationView?.loopMode = .autoReverse
        // podešavanje brzine animacije
        animationView?.animationSpeed = 0.7
        
        //animationView?.contentMode = .scaleAspectFill
        /*
        /// A keypath that finds the color value for all `Fill 1` nodes.
        let fillKeypath = AnimationKeypath(keypath: "**.Fill 1.Color")
        /// A Color Value provider that returns a reddish color.
        let redValueProvider = ColorValueProvider(Color(r: 1, g: 0.2, b: 0.3, a: 1))
        /// Set the provider on the animationView.
        animationView?.setValueProvider(redValueProvider, keypath: fillKeypath)*/
        
        /*
        // Create an animation view.
        let animation = Animation.named("LottieLogo1", subdirectory: "TestAnimations")
        // Some time later. Create a keypath to find any node named "Stroke 1"
        let keypath1 = AnimationKeypath(keypath: "**.Stroke 1")
        // Disable all nodes named Stroke 1, removing them from the current render tree.
        animationView?.setNodeIsEnabled(isEnabled: false, keypath: keypath1)
        // Re-enable all nodes named Stroke 1.
        //animationView?.setNodeIsEnabled(isEnabled: true, keypath: keypath1)*/
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { _ in
            self.animationView?.frame = self.viwSafeArea.bounds
        }
    }
}
