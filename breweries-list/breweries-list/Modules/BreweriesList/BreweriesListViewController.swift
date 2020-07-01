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
    func updateTableView()
}

class BreweriesListViewController: UIViewController, ViperView {
    // MARK: Constant
    
    // MARK: Variable
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    weak var presenter: BreweriesListPresenterProtocol!
    
    // MARK: Outlet
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Function
    func configureUI() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.title = Constants.breweriesListTitle
        configureSearchBar()
    }
    
    func configureSearchBar() {
        searchBar.layer.borderWidth = 0
        searchBar.backgroundImage = UIImage()
        searchBar.setTextFieldColor(color: .white)
        searchBar.delegate = self
    }
    
    func updateTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func stopSearchEvent() {
        
    }
}

extension BreweriesListViewController: BreweriesListViewProtocol {

}

extension BreweriesListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            presenter.isSearching = true
            presenter.startSearchEvent(searchText: searchText)
        } else {
            presenter.isSearching = false
            stopSearchEvent()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(false)
    }
}
