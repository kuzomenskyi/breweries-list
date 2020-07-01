//
//  BreweriesDB.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/1/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import SQLite

class BreweriesDB: IBreweriesDB {
    // MARK: Constant
    let separatorString = ","
    
    // MARK: Private Constant
    private let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true ).first!
    private let breweries = Table("Breweries")
    
    private let id = Expression<Int?>("id")
    private let name = Expression<String?>("name")
    private let breweryType = Expression<String?>("breweryType")
    private let street = Expression<String?>("street")
    private let city = Expression<String?>("city")
    private let state = Expression<String?>("state")
    private let postalCode = Expression<String?>("postalCode")
    private let country = Expression<String?>("country")
    private let longitude = Expression<String?>("longitude")
    private let latitude = Expression<String?>("latitude")
    private let phone = Expression<String?>("phone")
    private let websiteURL = Expression<String?>("websiteURL")
    private let updatedAt = Expression<String?>("updatedAt")
    private let tagList = Expression<String?>("tagList")
    #warning("tagList string must contain comma separated tags")
    
    // MARK: Variable
    
    // MARK: Private Variable
    lazy var db = try? Connection("\(path)/db.sqlite3")
    
    // MARK: Init
    init() {
        do {
            try db?.run(breweries.create { t in
                t.column(id)
                t.column(name)
                t.column(breweryType)
                t.column(street)
                t.column(city)
                t.column(state)
                t.column(postalCode)
                t.column(country)
                t.column(longitude)
                t.column(latitude)
                t.column(phone)
                t.column(websiteURL)
                t.column(updatedAt)
                t.column(tagList)
            })
        } catch(let error) {
            print("@@@@@ An error occured while creating database:", error)
        }
    }
    
    // MARK: Action
    
    // MARK: Function
    func getBreweries() -> [Brewery] {
        var output = [Brewery]()
        
        do {
            if let contentTypes = try db?.prepare(self.breweries) {
                output = contentTypes.map {
                    let tagListArray = $0[tagList]?.components(separatedBy: separatorString)
                    
                    let brewery = Brewery(id: $0[id], name: $0[name], breweryType: $0[breweryType], street: $0[street], city: $0[city], state: $0[state], postalCode: $0[postalCode], country: $0[country], longitude: $0[longitude], latitude: $0[latitude], phone: $0[phone], websiteURL: $0[websiteURL], updatedAt: $0[updatedAt], tagList: tagListArray)
                    
                    return brewery
                }
            }
        } catch(let error) {
            print("@@@@@ An error occured while getting breweries", error)
        }
        
        return output
    }
    
    func insert(brewery: Brewery) {
        
        let insertBrewery = breweries.insert(
            getSettersForBrewery(brewery)
        )
        
        do {
            try db?.run(insertBrewery)
            print("successfully inserted brewery")
        } catch(let error) {
            print("@@@@@ An error occured while insering breweriy:", error)
        }
    }
    
    func update(breweryWithID identifier: Int, newBrewery: Brewery) {
        let brewery = breweries.filter(self.name == name)
        
        let updateBreweries = brewery.update (
            getSettersForBrewery(newBrewery)
        )
        
        do {
            try db?.run(updateBreweries)
            print("successfully updated breweries")
        } catch(let error) {
            print("@@@@@ An error occured while updating breweries", error)
        }
    }
    
    func delete(breweryWithID identifier: Int) {
        let type = breweries.filter(self.id == identifier)
        let deleteType = type.delete()
        
        do {
            try db?.run(deleteType)
            print("successfully deleted brewery")
        } catch(let error) {
            print("@@@@@ An error occured while deleting brewery", error)
        }
    }
    
    // MARK: Private Function
    private func getSettersForBrewery(_ brewery: Brewery) -> [Setter] {
        let tagListString = brewery.tagList?.joined(separator: separatorString)
        
        let setters = [
            id <- brewery.id,
            name <- brewery.name,
            breweryType <- brewery.breweryType,
            street <- brewery.street,
            city <- brewery.city,
            state <- brewery.state,
            postalCode <- brewery.postalCode,
            country <- brewery.country,
            longitude <- brewery.longitude,
            latitude <- brewery.latitude,
            phone <- brewery.phone,
            websiteURL <- brewery.websiteURL,
            updatedAt <- brewery.updatedAt,
            tagList <- tagListString
        ]
        
        return setters
    }
}
