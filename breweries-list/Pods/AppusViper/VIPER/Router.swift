//
//  Router.swift
//  TopContributors
//
//  Copyright © 2019 Appus Studio LP. All rights reserved.
//

import Foundation
import UIKit

public protocol ViperRouter: class {
    associatedtype Presenter
    var presenter: Presenter! { get set }
    var viewController: UIViewController! { get set }

    init()
}
