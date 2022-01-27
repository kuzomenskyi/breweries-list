//
//  ModulePreviewView.swift
//
//  Created by Alexey Kubas on 7/20/18.
//  Copyright © 2018 Appus Studio LP. All rights reserved.
//

import Foundation
import UIKit

/*
    It seems that it is not possible to get bundle with class module outside this framework
    because interface builder did not load it (not needed by context)
 
    So soulution is to force interface builder to load bundle with our classes.
    We should subclass ViperModulePreviewView in another target
    and use subclass from storyboard.
 
    For example:
        We have 3 targets: AppusViper, MainApp, FrameworkWithModules
        MainApp and FrameworkWithModules contains some modules we using in MainApp
        To render flow chart in storyboard we will need to use 2 subclasses:
            1) `@IBDesignable MainAppModulePreviewView: ViperModulePreviewView { }`
            2)  ```
                @IBDesignable FrameworkModulePreviewView: ViperModulePreviewView {
                    override var bundle: Bundle {
                        return Bundle(for: FrameworkWithModules.AnyClassFromFramework.self)
                    }
                }
                ```
 */
@IBDesignable open class ViperModulePreviewView: UIView {
    @IBInspectable var moduleName: String!

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        loadModuleView()
    }
    
    open var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    private func loadModuleView() {
        let name = moduleName + "ViewController"
        guard let view = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController()?.view else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
}
