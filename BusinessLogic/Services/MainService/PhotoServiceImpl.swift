//
//  MainServiceImpl.swift
//  Photo
//
//  Created by Сергей Яковлев on 23.03.2022.
//

import Foundation

final class PhotoServiceImpl: AppRequestService, PhotoService {
    func fetchPhotos(page: Int, success: (([Photo]) -> Void)?, failure: (() -> Void)?) {
        request(PhotoEndpoint.mainPhoto(page), success: { (photo: [Photo]) in
            DispatchQueue.main.async {
                success?(photo)
            }
        }, failure: nil)
    }
}

