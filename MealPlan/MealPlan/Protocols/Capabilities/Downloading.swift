//
//  DownloadContent.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

protocol Downloading {
    
    func downloadContent<T>(url: URL, cachePolicy: NSURLRequest.CachePolicy, completion: @escaping (T?, Error?)->())

}


extension Downloading {
    
    //implement the protocols functions here - can make it return image, json, data etc
    
    func downloadContent<T>(url: URL, cachePolicy: NSURLRequest.CachePolicy, completion: @escaping (T?, Error?)->()) {
        let urlRequest = URLRequest(url: url, cachePolicy: cachePolicy)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            if T.self == UIImage.self {
                completion(UIImage(data: data) as? T, nil)
            } else if T.self == Data.self {
                completion(data as? T, nil)
            }
        })
    }
    
}
