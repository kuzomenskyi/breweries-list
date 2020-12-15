//
//  UINavigationController+StatusBar.swift
//
//
//  Created by vladimir.kuzomenskyi on 6/5/20.
//  Copyright © 2020 Appus Studio. All rights reserved.
//

import UIKit

extension UINavigationController {
    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
