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
    let cellHeight: CGFloat = 270
    
    // MARK: Variable
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    weak var presenter: BreweriesListPresenterProtocol!
    
    // MARK: Outlet
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var searchContainerView: UIView!
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        presenter.viewWillAppear?()
    }
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Function
    func configureUI() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.title = Constants.breweriesListTitle
        configureSearchBar()
        containerView.backgroundColor = UIColor.App.japaneseLaurel
        searchContainerView.backgroundColor = UIColor.App.japaneseLaurel
        configureTableView()
        presenter.subscribeForScreenTransitionNotification(handler: screenTransitionHandler)
    }
    
    /// Called immediately after UIDevice.orientationDidChangeNotification did sent
    func screenTransitionHandler() {
        
    }
    
    func configureSearchBar() {
        searchBar.layer.borderWidth = 0
        searchBar.backgroundImage = UIImage()
        searchBar.setTextFieldColor(color: .white)
        searchBar.delegate = self
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: R.nib.breweriesListCell.name, bundle: R.nib.breweriesListCell.bundle), forCellReuseIdentifier: R.reuseIdentifier.breweriesListCell.identifier)
        tableView.separatorStyle = .none
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

// MARK: - UISearchBarDelegate
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

// MARK: - UITableViewDelegate
extension BreweriesListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension BreweriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellID = R.reuseIdentifier.breweriesListCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: currentCellID) as? ConfigurableCell else {
            let cell = UITableViewCell()
            cell.backgroundColor = .red
            print("@@@@@ Failed to deque cell with specified identifier for PreweriesList's table view")
            return cell
        }
        
        let isIndexValid = indexPath.row <= (presenter.breweries.count - 1)
        guard !presenter.breweries.isEmpty, isIndexValid else { return cell }
        cell.configure(withAny: presenter.breweries[indexPath.row])
        return cell
    }
}
