//
//  UIViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit

extension UIViewController{
    class func fromNib(bundle: Bundle) -> Self {
            return self.init(nibName: String(describing: self), bundle: bundle)
    }
    
    func loadJSON<T: Codable>(url: String, dataModel: T, completion: @escaping (T) -> ()) {
        var decodedData = dataModel
        
        guard let url = URL(string: url) else{
            return 
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else{
                return
            }
            let decoder = JSONDecoder()
            decodedData = try! decoder.decode(type(of: dataModel), from: data)

            completion(decodedData)
        }.resume()
    }
}


