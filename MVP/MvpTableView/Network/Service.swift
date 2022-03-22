//
//  Service.swift
//  MvpTableView
//
//  Created by Владимир on 22.03.2022.
//

import UIKit
protocol  NetworkServiceProtocol {
    func loadData(complition: @escaping (Result<[Comment]?,Error>) -> Void)
}

class NetworkService  : NetworkServiceProtocol {
    static let shared = NetworkService()
    
    func loadData(complition: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlstr = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlstr) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error  in
            if let error = error {
                complition(.failure(error))
                return
            }
            do {
                let objects = try JSONDecoder().decode([Comment].self, from: data!)
                complition(.success(objects))
            } catch {
                complition(.failure(error))
            }
        }.resume()
        
    }
}
