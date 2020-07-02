//
//  BreweriesListInteractor.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper

protocol BreweriesListInteractorProtocol: class {
    func getBreweries(breweryRequest: BreweryRequest, completion: @escaping (Result<[Brewery], BreweryError>) -> Void)
}

final class BreweriesListInteractor: ViperInteractor {
    // MARK: Constant
    
    // MARK: Variable
    weak var presenter: BreweriesListPresenterProtocol!
    var breweriesManager: IBreweriesManager = BreweriesManager()
    
    // MARK: Function
    func getBreweries(breweryRequest: BreweryRequest, completion: @escaping (Result<[Brewery], BreweryError>) -> Void) {
        breweriesManager.getBreweries(breweryRequest: breweryRequest, completion: completion)
    }
}

extension BreweriesListInteractor: BreweriesListInteractorProtocol {

}
