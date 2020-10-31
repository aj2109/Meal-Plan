//
//  ParseContent.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import Foundation


protocol Parsing {
    
    func parseData<T: Codable>(data: Data, completion: @escaping (T?, Error?)->())
}

extension Parsing {
    
    func parseData<T: Codable>(data: Data, completion: @escaping (T?, Error?)->()) {
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            completion(object, nil)
        } catch {
            completion(nil, error)
        }
    }
}
