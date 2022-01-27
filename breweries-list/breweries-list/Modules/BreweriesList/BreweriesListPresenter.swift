//
//  BreweriesListPresenter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper

protocol BreweriesListPresenterProtocol: TextValidator, IViewLifeCycle {
    var breweries: [Brewery] { get }
    var filteredBreweries: [Brewery] { get }
    var isSearching: Bool { get set }
    var isPortrait: Bool { get }
    
    func startSearchEvent(searchText: String)
    func subscribeForScreenTransitionNotification(handler: @escaping Completion)
}

final class BreweriesListPresenter: ViperPresenter {
    // MARK: Constant
    
    // MARK: Variable
    weak var view: BreweriesListViewProtocol!
    weak var interactor: BreweriesListInteractorProtocol!
    weak var router: BreweriesListRouterProtocol!
    var breweriesDB: IBreweriesDB = BreweriesDB()
    
    var breweries: [Brewery] {
        get {
            return breweriesDB.getBreweries()
        }
        set(newBreweries) {
            newBreweries.forEach { breweriesDB.insert(brewery: $0) }
            view.updateTableView()
        }
    }
    #warning("Remove that after configuring fetching breweries using API")
//    var breweries: [Brewery] = [
//        Brewery(id: 0, name: "name", breweryType: "breweryType", street: "street", city: "city", state: "state", postalCode: "postal code", country: "country", longitude: "longitude", latitude: "latitude", phone: "phone", websiteURL: "websiteURL", updatedAt: "updatedAt", tagList: ["tag1", "tag2"]),
//        Brewery(id: 0, name: "name", breweryType: "breweryType", street: "street", city: "city", state: "state", postalCode: "postal code", country: "country", longitude: "longitude", latitude: "latitude", phone: "phone", websiteURL: "websiteURL", updatedAt: "updatedAt", tagList: ["tag1", "tag2"]),
//        Brewery(id: 0, name: "name", breweryType: "breweryType", street: "street", city: "city", state: "state", postalCode: "postal code", country: "country", longitude: "longitude", latitude: "latitude", phone: "phone", websiteURL: "websiteURL", updatedAt: "updatedAt", tagList: ["tag1", "tag2"])
//    ]
    
    var filteredBreweries = [Brewery]() {
        didSet {
            view.updateTableView()
        }
    }
    
    var isSearching = false {
        didSet {
            view.updateTableView()
        }
    }
    
    var isPortrait: Bool { return UIScreen.main.bounds.width < UIScreen.main.bounds.height }
    
    // MARK: Action
    func startSearchEvent(searchText: String) {
        guard isSearchTextValid(searchText) else { return }
        
        filteredBreweries = breweries.filter {
            var nameComponents = [String]()
            
            if let name = $0.name {
                nameComponents = name.components(separatedBy: " ")
            }
            var output = false
            
            for nameComponent in nameComponents {
                if nameComponent.prefix(searchText.count).lowercased() == searchText.lowercased() {
                    output = true
                }
            }
            return output
        }
    }
    
    // MARK: Function
    func viewDidLoad() {
        let breweryRequest = BreweryRequest(httpMethod: .get, resourceURL: .listBreweries)
        interactor.getBreweries(breweryRequest: breweryRequest, completion: { [unowned self] result in
            switch result {
            case .success(let breweries):
                self.breweries = breweries
            case .failure(let breweryError):
                print("@@@@@ An error occured while fetching breweries:", breweryError)
            }
        })
    }
    
    // MARK: - Private Function
    private func isSearchTextValid(_ searchText: String) -> Bool {
        let validationRules = ValidationRules(minLength: 1, areSpaceSymbolsConsidered: false)
        var output = true
        
        validate(searchText, textFieldName: nil, withRules: validationRules, completion: { error in
            if error != nil {
                output = false
            }
        })
        
        return output
    }
}

extension BreweriesListPresenter: BreweriesListPresenterProtocol {
    func subscribeForScreenTransitionNotification(handler: @escaping Completion) {
        interactor.subscribeForScreenTransitionNotification(handler: handler)
    }
}
