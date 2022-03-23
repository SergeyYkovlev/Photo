//
//  FotoModule.swift
//  Foto
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import UIKit

protocol MainModuleInput: AnyObject {
    var state: MainState { get }
    func update(force: Bool, animated: Bool)
}

protocol MainModuleOutput: AnyObject {
}

final class MainModule {

    var input: MainModuleInput {
        return presenter
    }

    var output: MainModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: MainViewController
    private let presenter: MainPresenter

    init(state: MainState = .init()) {
        let listItemsFactory = MainListItemsFactory()
        let presenter = MainPresenter(state: state, dependencies: [Any](), listItemsFactory: listItemsFactory)
        let viewModel = MainViewModel(state: state, listItemsFactory: listItemsFactory)
        let viewController = MainViewController(viewModel: viewModel, output: presenter)
        listItemsFactory.output = presenter
        listItemsFactory.viewController = viewController
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
