//
//  ServiceFactory.swift
//  Photo
//
//  Created by Сергей Яковлев on 24.03.2022.
//

import Foundation

typealias ServicesAlias = HasRequestFactory &
                            HasPhotoService

var Services: ServicesAlias { // swiftlint:disable:this variable_name
    return MainServicesFactory()
}

final class MainServicesFactory: ServicesAlias {
    lazy var photoService: PhotoService = PhotoServiceImpl(dependencies: Services)
    lazy var requestFactory: RequestFactory = AppRequestFactory()
}

// MARK: Singletons

private final class SingletonsPool {

}
