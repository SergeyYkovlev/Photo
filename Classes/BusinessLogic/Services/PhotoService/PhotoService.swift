//
//  MainService.swift
//  Photo
//
//  Created by Сергей Яковлев on 23.03.2022.
//

import Foundation

protocol HasPhotoService {

    var photoService: PhotoService { get }
}

protocol PhotoService: AnyObject {
    func fetchPhotos(page: Int, success: PhotoService.Success?, failure: PhotoService.Failure?)
}

extension PhotoService {
    typealias Success = ([Photo]) -> Void
    typealias Failure = (GeneralRequestError) -> Void
}
