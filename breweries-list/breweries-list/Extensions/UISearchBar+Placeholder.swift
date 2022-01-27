//
//  UISearchBar+Placeholder.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 15.07.2020.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import UIKit

extension UISearchBar {
    func setCenteredPlaceHolder(){
        let textFieldInsideSearchBar = self.getTextField()
        
        let searchBarWidth = self.frame.width
        let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width
        let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 8
        let placeHolderWithIcon = placeholderIconWidth! + offsetIconToPlaceholder
        
        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - placeHolderWithIcon), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }
}
