//
//  FotoModule.swift
//  Foto
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import UIKit

protocol PhotoModuleInput: AnyObject {
    var state: PhotoState { get }
    func update(force: Bool, animated: Bool)
}

protocol PhotoModuleOutput: AnyObject {
}

final class PhotoModule {

    var input: PhotoModuleInput {
        return presenter
    }

    var output: PhotoModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: PhotoViewController
    private let presenter: PhotoPresenter

    init(state: PhotoState = .init()) {
        let presenter = PhotoPresenter(state: state)
        let viewModel = PhotoViewModel()
        let viewController = PhotoViewController(viewModel: viewModel, output: presenter)
//        listItemsFactory.output = presenter
//        listItemsFactory.viewController = viewController
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
