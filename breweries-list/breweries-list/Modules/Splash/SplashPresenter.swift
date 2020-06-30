//
//  SplashPresenter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper

protocol SplashPresenterProtocol: class {

}

final class SplashPresenter: ViperPresenter {
    
    // MARK: Constant
    
    // MARK: Variable
    weak var view: SplashViewProtocol!
    weak var interactor: SplashInteractorProtocol!
    weak var router: SplashRouterProtocol!
    
    // MARK: Action
    
    // MARK: Function
}

extension SplashPresenter: SplashPresenterProtocol {

}
