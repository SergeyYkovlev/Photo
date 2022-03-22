//
//  MainCoordinator.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import  UIKit

class MainCoordinator: BaseCoordinator <UINavigationController> {

    let window: UIWindow
    let photoModule = PhotoModule()

    init(window: UIWindow) {
        self.window = window
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

extension MainCoordinator: PhotoModuleOutput {

}
