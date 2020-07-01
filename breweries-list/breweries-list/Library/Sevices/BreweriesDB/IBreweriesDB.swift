//
//  IBreweriesDB.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/1/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation

protocol IBreweriesDB: class {
    func getBreweries() -> [Brewery]
    func insert(brewery: Brewery)
    func update(breweryWithID identifier: Int, newBrewery: Brewery)
    func delete(breweryWithID identifier: Int)
}
