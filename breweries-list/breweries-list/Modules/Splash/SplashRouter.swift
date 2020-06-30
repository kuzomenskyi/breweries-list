//
//  SplashRouter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper
import UIKit

protocol SplashRouterProtocol: class {

}

final class SplashRouter: ViperRouter {
    // MARK: Constant
    
    // MARK: Variable
    weak var viewController: UIViewController!
    weak var presenter: SplashPresenterProtocol!
    
    // MARK: Function
}

extension SplashRouter: SplashRouterProtocol {

}
