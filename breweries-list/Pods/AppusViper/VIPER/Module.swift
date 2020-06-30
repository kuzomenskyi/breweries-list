//
//  ViperRouter.swift
//
//  Copyright © 2018 Appus Studio LP. All rights reserved.
//

import Foundation
import UIKit

private struct AssociatedKeys {
    static var moduleBuilder = "moduleBuilder"
}

public extension ViperView {
    var viperModuleBuilder: Any! {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.moduleBuilder)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.moduleBuilder, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

open class Module<View: ViperView, Presenter: ViperPresenter, Interactor: ViperInteractor, Router: ViperRouter> {
    public weak var view: View!
    public var interactor: Interactor!
    public var presenter: Presenter!
    public var router: Router!
    
    public init() {
        self.build()
    }
    
    private func build() {
        let storyboardName = String(describing: View.self)
        let bundle = Bundle(for: View.self)
        guard let viewController = UIStoryboard(name: storyboardName, bundle: bundle)
            .instantiateInitialViewController() as? View else {
            fatalError("Please check your storyboard for '\(storyboardName)'")
        }
        
        view = viewController
        router = Router()
        interactor = Interactor()
        presenter = Presenter()
        
        // Assemble
        guard let viperView = view as? Presenter.View,
            let viperInteractor = interactor as? Presenter.Interactor,
            let viperRouter = router as? Presenter.Router,
            let viperRouterPresenter = presenter as? Router.Presenter,
            let viperViewPresenter = presenter as? View.Presenter,
            let viperInteractorPresenter = presenter as? Interactor.Presenter else {
                fatalError("Incompatible types.")
        }
        
        presenter.view = viperView
        presenter.interactor = viperInteractor
        presenter.router = viperRouter
        view.presenter = viperViewPresenter
        interactor.presenter = viperInteractorPresenter
        router.presenter = viperRouterPresenter
        router.viewController = view
        
        // View retains all components
        view.viperModuleBuilder = self
    }
}
