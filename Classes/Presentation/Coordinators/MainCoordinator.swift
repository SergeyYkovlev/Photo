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
    let fotoModule = PhotoModule()

    init(window: UIWindow) {
        self.window = window
        let rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        super.init(rootViewController: rootViewController)
    }

    override func start() {
        fotoModule.output = self
        rootViewController.pushViewController(fotoModule.viewController, animated: true)
    }
}

extension MainCoordinator: PhotoModuleOutput {

}
