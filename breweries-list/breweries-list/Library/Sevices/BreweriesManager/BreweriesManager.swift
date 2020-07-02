//
//  BreweriesManager.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/2/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation

class BreweriesManager: IBreweriesManager {
    
    // MARK: Constant
    
    // MARK: Variable
    var session: URLSession? = URLSession.shared
    
    // MARK: Init
    
    // MARK: Function
    func getBreweries(breweryRequest: BreweryRequest, completion: @escaping (Result<[Brewery], BreweryError>) -> Void) {
        get(breweryRequest: breweryRequest, completion: { (result) in
            completion(result)
        })
    }
    
    // MARK: Private Function
    private func get<T: Decodable>(breweryRequest: BreweryRequest, completion: @escaping (Result<T, BreweryError>) -> Void) {
        guard var request = breweryRequest.request else { return }
        request.addValue("text/json", forHTTPHeaderField: "Content-Type")
        
        session?.dataTask(with: request) {data, response, error in
            guard let data = data else {
                completion(.failure(.noDataAvailable)); return
            }
            
            if let error = error {
                print("An error occured:", error)
            }
            
            let decoder = JSONDecoder()
            do {
                let output = try decoder.decode(T.self, from: data)
                completion(.success(output))
            } catch {
                print(error)
                completion(.failure(.cannotProcessData))
            }
        }.resume()
    }
}
