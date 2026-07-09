//
//  DataTransferService.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

protocol DataTransferService {
    func request<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void)
}

class DefaultDataTransferService: DataTransferService {

    func request<T: Decodable>(url: String, completion: @escaping (Result<T, any Error>) -> Void) {
        guard let url = URL(string: url) else {
            return
        }

        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(error))
            }

            guard let data = data else {
                return
            }

            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
                print(decodeData)
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
