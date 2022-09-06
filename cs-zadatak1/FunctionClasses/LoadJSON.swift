//
//  LoadJSON.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 25.08.2022..
//

import UIKit

class LoadJSON{
    func loadJsonFromUrl<T: Codable>(url: String, dataModel: T, completion: @escaping (T) -> ()) {
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
