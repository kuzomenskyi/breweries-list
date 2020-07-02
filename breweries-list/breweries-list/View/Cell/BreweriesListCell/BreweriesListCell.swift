//
//  BreweriesListCell.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 7/1/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import UIKit

class BreweriesListCell: UITableViewCell {
    // MARK: Constant
    
    // MARK: Variable
    lazy var labelContainerViews = [countryContainerView, stateContainerView, cityContainerView, streetContainerView, streetContainerView, phoneContainerView, websiteContainerView, mapContainerView]
    
    
    // MARK: Outlet
    @IBOutlet var containerView: UIView!
    @IBOutlet var countryContainerView: UIView!
    @IBOutlet var stateContainerView: UIView!
    @IBOutlet var cityContainerView: UIView!
    @IBOutlet var streetContainerView: UIView!
    @IBOutlet var phoneContainerView: UIView!
    @IBOutlet var websiteContainerView: UIView!
    @IBOutlet var mapContainerView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var stateNameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var streenLabel: UILabel!
    @IBOutlet var streetNameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var phoneNameLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet var websiteNameLabel: UILabel!
    @IBOutlet var mapButton: UIButton!
    
    // MARK: Init
    
    // MARK: Action
    @IBAction func mapButtonEvent(_ sender: Any) {
        print("mapButtonEvent")
    }
    
    // MARK: Function
    func configure(withBrewery brewery: Brewery) {
        selectionStyle = .none
        backgroundColor = .white
        configureContainerView()
        
        if let breweryName = brewery.name {
            nameLabel.text = breweryName
        }
        
        countryNameLabel.text = brewery.country ?? ""
        stateNameLabel.text = brewery.state ?? ""
        cityNameLabel.text = brewery.city ?? ""
        streetNameLabel.text = brewery.street ?? ""
        phoneNameLabel.text = brewery.phone ?? ""
        websiteNameLabel.text = brewery.websiteURL ?? ""
        
        hideEmptyLabels()
    }
    
    func configureContainerView() {
        containerView.backgroundColor = UIColor.App.titanWhite
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor.App.japaneseLaurel.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 20
    }
    
    func hideEmptyLabels() {
        let labels = [countryNameLabel, stateNameLabel, cityNameLabel, streetNameLabel, phoneNameLabel, websiteNameLabel]
        labels.forEach {
            let isLabelTextEmpty = $0?.text == ""
            $0?.isHidden = isLabelTextEmpty
        }
        
        labelContainerViews.compactMap { $0 }.forEach {
            let isLabelContainsHiddenViews = !$0.subviews.filter { $0.isHidden == true }.isEmpty
            $0.isHidden = isLabelContainsHiddenViews
        }
    }
}

// MARK: - ConfigurableCell
extension BreweriesListCell: ConfigurableCell {
    func configure(withAny input: Any) {
        if let brewery = input as? Brewery {
            configure(withBrewery: brewery)
        }
    }
}
