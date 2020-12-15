//
//  BreweriesListRouter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper
import UIKit

protocol BreweriesListRouterProtocol: class {

}

final class BreweriesListRouter: ViperRouter {
    // MARK: Constant
    
    // MARK: Variable
    weak var viewController: UIViewController!
    weak var presenter: BreweriesListPresenterProtocol!
    
    // MARK: Function
}

extension BreweriesListRouter: BreweriesListRouterProtocol {

}
