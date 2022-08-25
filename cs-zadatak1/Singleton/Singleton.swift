//
//  Singleton.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 25.08.2022..
//

import Foundation


//  You create simple singletons using a static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously:
class Singleton {
    static let shared = Singleton()
}

//  If you need to perform additional setup beyond initialization, you can assign the result of the invocation of a closure to the global constant:
/*class Singleton {
    static let shared: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
}
*/
