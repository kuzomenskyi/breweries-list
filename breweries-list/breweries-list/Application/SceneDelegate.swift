//
//  SceneDelegate.swift
//  breweries-list
//
//  Created by vladimir.kuzomenskyi on 6/30/20.
//  Copyright © 2020 vladimir.kuzomenskyi. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Constant
    
    // MARK: Variable
    var window: UIWindow?
    
    // MARK: Function

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        let homeScreen = Splash().view

        window?.rootViewController = homeScreen
        window?.makeKeyAndVisible()
    }
}

