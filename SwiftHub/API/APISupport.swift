//
//  APISupport.swift
//  SwitfHub
//
//  Created by Elias Medeiros on 24/10/20.
//

import Foundation

public enum APIError: Error {
    case malformedURL
    case apiError
    case invalidResponse
    case noData
    case decodeError
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)

                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}

extension URL {
    mutating func append(_ queryItem: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        self = urlComponents.url!
    }
}
