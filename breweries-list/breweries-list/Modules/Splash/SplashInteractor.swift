//
//  SplashInteractor.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper

protocol SplashInteractorProtocol: class {

}

final class SplashInteractor: ViperInteractor {
    // MARK: Constant
    
    // MARK: Variable
    weak var presenter: SplashPresenterProtocol!
    
    // MARK: Function
}

extension SplashInteractor: SplashInteractorProtocol {

}
