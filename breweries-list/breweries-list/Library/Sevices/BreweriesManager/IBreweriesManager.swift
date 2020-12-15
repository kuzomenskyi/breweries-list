//
//  IBreweriesManager.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/2/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation

protocol IBreweriesManager: class {
    func getBreweries(breweryRequest: BreweryRequest, completion: @escaping (Result<[Brewery], BreweryError>) -> Void)
}
