//
//  MainServiceImpl.swift
//  Photo
//
//  Created by Сергей Яковлев on 23.03.2022.
//

import Foundation

final class PhotoServiceImpl: AppRequestService, PhotoService {

    private var task: URLSessionDataTask? {
        willSet {
            task?.cancel()
        }
    }

    func fetchPhotos(page: Int, success: (([Photo]) -> Void)?, failure: ((GeneralRequestError) -> Void)?) {
        task = request(PhotoEndpoint.mainPhotos(page), success: { (photos: [Photo]) in
             DispatchQueue.main.async {
                 success?(photos)
             }
         }, failure: nil)
     }
}
