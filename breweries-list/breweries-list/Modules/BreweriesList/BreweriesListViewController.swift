//
//  BreweriesListViewController.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper
import UIKit

protocol BreweriesListViewProtocol: class {

}

class BreweriesListViewController: UIViewController, ViperView {
    // MARK: Constant
    
    // MARK: Variable
    weak var presenter: BreweriesListPresenterProtocol!
    
    // MARK: Outlet
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Function
}

extension BreweriesListViewController: BreweriesListViewProtocol {

}
