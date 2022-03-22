//
//  SceneDelegate.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowSceen = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: windowSceen)
        self.window = window
        coordinator = .init(window: window)
        coordinator?.start()
    }
}
