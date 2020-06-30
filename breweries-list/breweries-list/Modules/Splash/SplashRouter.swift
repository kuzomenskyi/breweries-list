//
//  SplashRouter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper
import UIKit

protocol SplashRouterProtocol: class {
    func showMain()
}

final class SplashRouter: ViperRouter {
    // MARK: Constant
    
    // MARK: Variable
    weak var viewController: UIViewController!
    weak var presenter: SplashPresenterProtocol!
    
    // MARK: Function
    func showMain() {
        guard let main = BreweriesList().view else { return }
        
        let navigationController = UINavigationController(rootViewController: main)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .fullScreen
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.backgroundEffect = .none
            navBarAppearance.backgroundImage = nil
            navBarAppearance.backgroundColor = UIColor.App.japaneseLaurel
            navBarAppearance.shadowColor = .clear
            navBarAppearance.shadowImage = UIImage()
            navBarAppearance.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.fontWithProperties(name: .avenir, style: .heavy, size: 18) ?? .systemFont(ofSize: 18, weight: .heavy)
            ]
            navigationController.navigationBar.tintColor = .white
            navigationController.navigationBar.standardAppearance = navBarAppearance
        } else {
            let navBar = navigationController.navigationBar
            navBar.shadowImage = UIImage()
            navBar.barTintColor = UIColor.App.japaneseLaurel
            navBar.isTranslucent = false
            navBar.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.fontWithProperties(name: .avenir, style: .heavy, size: 18) ?? .systemFont(ofSize: 18, weight: .heavy),
            ]
            navigationController.navigationBar.tintColor = .white
        }
        
        viewController.present(navigationController, animated: true)
    }
}

extension SplashRouter: SplashRouterProtocol {

}
