//
//  PhotoPresenter.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import CoreLocation

final class PhotoPresenter {
    typealias Dependencies = Any

    var view: PhotoViewInput?
    weak var output: PhotoModuleOutput?

    var state: PhotoState
    private let networkService = NetworkService()
    private let dependencies: Dependencies
    private let listItemsFactory: MainListItemsFactory

    init(state: PhotoState,
         dependencies: Dependencies,
         listItemsFactory: MainListItemsFactory) {
        self.state = state
        self.dependencies = dependencies
        self.listItemsFactory = listItemsFactory
    }

}

extension PhotoPresenter: PhotoViewOutput {
    func viewDidLoad() {
        networkService.requestPhotos { [weak self] result in
            switch result {
            case .success(let responce):
                self?.state.photos = responce
                self?.update(force: false, animated: true)
            case .failure(_):
                break
            }
        }
        update(force: true, animated: false)
    }
}

extension PhotoPresenter: PhotoModuleInput {
    func update(force: Bool, animated: Bool) {
        let viewModel = PhotoViewModel(state: state, listItemsFactory: listItemsFactory)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
