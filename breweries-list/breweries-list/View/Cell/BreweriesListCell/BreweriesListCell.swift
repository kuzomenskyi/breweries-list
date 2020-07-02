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
    
    // MARK: Outlet
    @IBOutlet var containerView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countryContainerView: UIView!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var stateContainerView: UIView!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var stateNameLabel: UILabel!
    @IBOutlet var cityContainerView: UIView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var streetContainerView: UIView!
    @IBOutlet var streenLabel: UILabel!
    @IBOutlet var streetNameLabel: UILabel!
    @IBOutlet var phoneContainerView: UIView!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var phoneNameLabel: UILabel!
    @IBOutlet var websiteContainerView: UIView!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet var websiteNameLabel: UILabel!
    @IBOutlet var mapContainerView: UIView!
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
        
        nameLabel.text = brewery.name ?? ""
        countryNameLabel.text = brewery.country ?? ""
        stateNameLabel.text = brewery.state ?? ""
        cityNameLabel.text = brewery.city ?? ""
        streetNameLabel.text = brewery.street ?? ""
        phoneNameLabel.text = brewery.phone ?? ""
        websiteNameLabel.text = brewery.websiteURL ?? ""
    }
    
    func configureContainerView() {
        containerView.backgroundColor = UIColor.App.titanWhite
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor.App.japaneseLaurel.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 20
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
