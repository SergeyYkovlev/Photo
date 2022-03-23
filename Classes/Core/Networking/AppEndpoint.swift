//
//  ViewController.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation

protocol AppEndpoint: Endpoint {

    var authorizationRequired: Bool { get }
}

extension Endpoint {

    var baseURL: URL {
        return URL(string: "https://api.unsplash.com/")!
    }
}
