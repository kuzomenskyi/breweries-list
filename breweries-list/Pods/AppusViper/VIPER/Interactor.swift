//
//  Interactor.swift
//  TopContributors
//
//  Copyright © 2019 Appus Studio LP. All rights reserved.
//

import Foundation

public protocol ViperInteractor: class {
    associatedtype Presenter
    var presenter: Presenter! { get set }
    init()
}
