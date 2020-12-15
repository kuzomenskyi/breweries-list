//
//  SearchBar.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 15.07.2020.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import UIKit

class SearchBar: UISearchBar {
    // MARK: Constant
    
    // MARK: Variable
    
    // MARK: Private Variable
    var customPlaceholder = UILabel()
    
    // MARK: Outlet
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Function
    func centerPlaceholder() {
        setStandardIcon(hidden: true)
        getTextField()?.placeholderLabel?.isHidden = true
    }
    
    func setStandardIcon(hidden needsToHideIcon: Bool) {
        #warning("White square may be drawn here. If yes, refactor this method")
        if needsToHideIcon {
            setImage(UIImage(), for: .search, state: .normal)
        } else {
            setImage(R.image.magnifying_glass(), for: .search, state: .normal)
        }
    }
}
