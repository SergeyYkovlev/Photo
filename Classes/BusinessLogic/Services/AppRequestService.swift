//
//  AppRequestService.swift
//  Photo
//
//  Created by Сергей Яковлев on 24.03.2022.
//

import Foundation

class AppRequestService: RequestService {

    override init(sessionTaskService: SessionTaskService = .init(),
                  requestFactory: RequestFactory = .init(),
                  decoder: JSONDecoder = .init()) {
        super.init(sessionTaskService: sessionTaskService, requestFactory: requestFactory, decoder: decoder)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
}
