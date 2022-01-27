//
//  Presenter.swift
//  TopContributors
//
//  Copyright © 2019 Appus Studio LP. All rights reserved.
//

import Foundation

public protocol ViperPresenter: class {
    associatedtype Router
    associatedtype View
    associatedtype Interactor
    var view: View! { get set }
    var interactor: Interactor! { get set }
    var router: Router! { get set }
    init()
}
