//
//  PhotoPresenter.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import CoreLocation

final class PhotoPresenter {
    
    var view: PhotoViewInput?
    weak var output: PhotoModuleOutput?
    
    var state: PhotoState
    private let networkService = NetworkService()
    
    init(state: PhotoState) {
        self.state = state
    }
    
}

extension PhotoPresenter: PhotoViewOutput {
    func requestPhoto() {
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
        let viewModel = PhotoViewModel()
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
