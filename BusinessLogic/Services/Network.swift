//
//  Network.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation

class NetworkService {
    private let token = "dB86dZXCRtPvOOvW1PS0oQyrIWb5jCIjo780ltUgpwI"
    private let page = 1
    func requestPhotos(completion: @escaping (Result<[Photos], Error>) -> Void) {
        let urlString = "https://api.unsplash.com/photos/?client_id=\(token)&\(page)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let photos = try JSONDecoder().decode([Photos].self, from: data)
                    completion(.success(photos))
                }
                catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
