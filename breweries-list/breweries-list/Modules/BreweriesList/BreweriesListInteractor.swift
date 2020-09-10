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
    func subscribeForScreenTransitionNotification(handler: @escaping Completion)
}

final class BreweriesListInteractor: ViperInteractor {
    // MARK: Constant
    
    // MARK: Variable
    weak var presenter: BreweriesListPresenterProtocol!
    var breweriesManager: IBreweriesManager = BreweriesManager()
    var screenEventsObserver: IScreenEventsObserver = ScreenEventsObserver()
    
    // MARK: Function
    func getBreweries(breweryRequest: BreweryRequest, completion: @escaping (Result<[Brewery], BreweryError>) -> Void) {
        breweriesManager.getBreweries(breweryRequest: breweryRequest, completion: completion)
    }
    
    func subscribeForScreenTransitionNotification(handler: @escaping Completion) {
        screenEventsObserver.observeForScreenTransition(handler: handler)
    }
}

extension BreweriesListInteractor: BreweriesListInteractorProtocol {

}
