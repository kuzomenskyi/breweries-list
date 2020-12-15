//
//  BreweryRequest.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/2/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation

struct BreweryRequest {
    enum HTTPMethod: String {
        case get = "GET", post = "POST", put = "PUT", patch = "PATCH", delete = "DELETE"
    }
    
    enum ResourceURL: String {
        case listBreweries = "breweries", searchBreweries = "search"
    }
    
    // MARK: Constant
    
    // MARK: Variable
    var token: String?
    var brewery: Brewery?
    var resourceURL: URL?
    var request: URLRequest?
    
    // MARK: Private Variable
    
    // MARK: Init
    init(token: String? = nil, brewery: Brewery? = nil, httpMethod: BreweryRequest.HTTPMethod, resourceURL: BreweryRequest.ResourceURL, existingBreweryID: String? = nil) {
        self.token = token
        self.brewery = brewery
        
        var urlString = "\(Constants.baseURL)/\(resourceURL.rawValue)"
        if let existingBreweryID = existingBreweryID {
            urlString.append("/\(existingBreweryID)")
        }
        self.resourceURL = URL(string: urlString)
        
        assert(self.resourceURL != nil, "@@@@@ Failed to create ProductRequest's resourceURL")
        guard let resourceURL = self.resourceURL else { return }
        var newRequest = URLRequest(url: resourceURL)
        
        if let bearer = token {
            newRequest.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        }
        
        newRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        newRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        newRequest.httpMethod = httpMethod.rawValue
        
        self.request = newRequest
    }
    
    // MARK: Function
}
