//
//  ApiManager.swift
//  APICollectionImage
//
//  Created by Thawatchai Phuchana on 14/8/2562 BE.
//  Copyright © 2562 Thawatchai Phuchana. All rights reserved.
//

import Foundation

class ApiManager {
    func getItems(urlString:String,completion: @escaping ([Beer]) -> Void) {
        guard let url = URL(string:urlString)else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        if token != nil , keys != nil{
//            request.setValue(token, forHTTPHeaderField: keys)
//        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print("error")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        
                        
                        let beer  = try JSONDecoder().decode([Beer].self, from: data)
                        print(beer)
                        completion(beer)
                    } catch (let error){
                        print(error)
                        print("parse JSON failed")
                    }
                }
            }
        }
        task.resume()
    }
}
