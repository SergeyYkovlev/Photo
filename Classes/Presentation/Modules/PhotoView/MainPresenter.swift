//
//  PhotoPresenter.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import CoreLocation

final class MainPresenter {
    typealias Dependencies = Any

    var view: MainViewInput?
    weak var output: MainModuleOutput?

    let searchService: PhotoServiceImpl = .init()

    var state: MainState
    private let dependencies: Dependencies
    private let listItemsFactory: MainListItemsFactory

    init(state: MainState,
         dependencies: Dependencies,
         listItemsFactory: MainListItemsFactory) {
        self.state = state
        self.dependencies = dependencies
        self.listItemsFactory = listItemsFactory
    }
}

extension MainPresenter: MainViewOutput {
    func viewDidLoad() {
        searchService.fetchPhotos(page: 1, success: { [weak self] photo in
            self?.state.photos = photo
            self?.update(force: false, animated: true)
        }, failure: nil)
    }
}

extension MainPresenter: MainModuleInput {
    func update(force: Bool, animated: Bool) {
        let viewModel = MainViewModel(state: state, listItemsFactory: listItemsFactory)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
