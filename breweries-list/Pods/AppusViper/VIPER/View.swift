//
//  View.swift
//  TopContributors
//
//  Copyright © 2019 Appus Studio LP. All rights reserved.
//

import Foundation
import UIKit

public protocol ViperView where Self: UIViewController {
    associatedtype Presenter
    var presenter: Presenter! { get set }
}
