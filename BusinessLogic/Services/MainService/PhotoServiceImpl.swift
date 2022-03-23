//
//  MainServiceImpl.swift
//  Photo
//
//  Created by Сергей Яковлев on 23.03.2022.
//

import Foundation

final class PhotoServiceImpl: AppRequestService, PhotoService {
    func fetchPhotos(page: Int, success: (([Photo]) -> Void)?, failure: (() -> Void)?) {
        request(PhotoEndpoint.mainPhotos(page), success: { (photos: [Photo]) in
            DispatchQueue.main.async {
                success?(photos)
            }
        }, failure: nil)
    }
}

