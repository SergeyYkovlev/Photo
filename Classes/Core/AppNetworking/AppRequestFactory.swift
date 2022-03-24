//
//  ViewController.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation

protocol HasRequestFactory {

    var requestFactory: RequestFactory { get }
}

final class AppRequestFactory: RequestFactory {

    var authHeader: Header?

    override func makeRequest(endpoint: Endpoint) throws -> URLRequest {
        let request = try super.makeRequest(endpoint: endpoint)
        return request
    }
}
