//
//  Photo.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import UIKit

final class Photos: Decodable {
    var id: String
    var width: Int
    var height: Int
    var color: String
    var user: User
    var urls: Urls
}

final class User: Decodable {
    var name: String
}

final class Urls: Decodable {
    var raw: String
    var full: String
    var regular: String
    var small: String
    var thumb: String
}
