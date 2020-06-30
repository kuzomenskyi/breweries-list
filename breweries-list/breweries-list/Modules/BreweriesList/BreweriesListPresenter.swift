//
//  BreweriesListPresenter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper

protocol BreweriesListPresenterProtocol: class {

}

final class BreweriesListPresenter: ViperPresenter {
    // MARK: Constant
    
    // MARK: Variable
    weak var view: BreweriesListViewProtocol!
    weak var interactor: BreweriesListInteractorProtocol!
    weak var router: BreweriesListRouterProtocol!
    
    // MARK: Action
    
    // MARK: Function
}

extension BreweriesListPresenter: BreweriesListPresenterProtocol {

}
