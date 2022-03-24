//
//  MainEndpoint.swift
//  Photo
//
//  Created by Сергей Яковлев on 23.03.2022.
//

import Foundation

enum PhotoEndpoint {
    case mainPhotos(_ page: Int)
    static var token = "yTsBvTOVn8J6qUgrOtA3qmAQjureSk5r6NvtofZ8mtI"
}

extension PhotoEndpoint: AppEndpoint {
    var baseURL: URL {
        return URL(fileURLWithPath: "https://api.unsplash.com/")
    }

    var path: String {
        switch self {
        case .mainPhotos:
            return "photos"
        }
    }

    var method: Method {
        return .get
    }

    var authorizationRequired: Bool {
        return false
    }

    var parameters: [String: String] {
        var param : [String: String] = [:]
        param["client_id"] = PhotoEndpoint.token
        switch self {
        case .mainPhotos(let page):
            param["page"] = String(page)
            return param
        }
    }
}
