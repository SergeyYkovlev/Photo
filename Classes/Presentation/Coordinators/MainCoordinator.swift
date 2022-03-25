//
//  MainCoordinator.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import  UIKit

class MainCoordinator: BaseCoordinator <UINavigationController> {

    typealias Dependencies = Any

    private let dependencies: Dependencies

    let window: UIWindow
    let photoModule = MainModule()

    init(window: UIWindow, dependencies: Dependencies = Services) {
        self.window = window
        self.dependencies = dependencies
        let rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        super.init(rootViewController: rootViewController)
    }

    override func start() {
        photoModule.output = self
        rootViewController.pushViewController(photoModule.viewController, animated: true)
    }
}

extension MainCoordinator: MainModuleOutput {

}
