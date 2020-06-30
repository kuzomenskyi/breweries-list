//
//  SplashViewController.swift
//  breweries-list
//
//  Created vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import Foundation
import AppusViper
import UIKit

protocol SplashViewProtocol: class {

}

class SplashViewController: UIViewController, ViperView {
    // MARK: Constant
    
    // MARK: Variable
    weak var presenter: SplashPresenterProtocol!
    
    // MARK: Outlet
    @IBOutlet var imageView: UIImageView!
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.alpha = 0
        presenter.viewDidLoad?()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
        presenter.viewDidAppear?()
    }
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Function
    func showAnimation() {
        UIView.animate(withDuration: presenter.animationTimeInterval / 2, delay: 0, options: [.showHideTransitionViews], animations: { [unowned self] in
            self.imageView.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: { [unowned self] _ in
            UIView.animate(withDuration: self.presenter.animationTimeInterval / 2, animations: { [unowned self] in
                self.view.backgroundColor = UIColor.App.japaneseLaurel
            })
        })
    }
}

extension SplashViewController: SplashViewProtocol {

}
