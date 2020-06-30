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

}

final class BreweriesListInteractor: ViperInteractor {
    // MARK: Constant
    
    // MARK: Variable
    weak var presenter: BreweriesListPresenterProtocol!
    
    // MARK: Function
}

extension BreweriesListInteractor: BreweriesListInteractorProtocol {

}
