//
//  SplashPresenter.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper

protocol SplashPresenterProtocol: IViewLifeCycle {
    var animationTimeInterval: TimeInterval { get }
}

final class SplashPresenter: ViperPresenter {
    
    // MARK: Constant
    let animationTimeInterval: TimeInterval = 2
    
    // MARK: Variable
    weak var view: SplashViewProtocol!
    weak var interactor: SplashInteractorProtocol!
    weak var router: SplashRouterProtocol!
    
    // MARK: Action
    
    // MARK: Function
    func viewDidAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + animationTimeInterval) { [unowned self] in
            self.router.showMain()
        }
    }
}

extension SplashPresenter: SplashPresenterProtocol {

}
