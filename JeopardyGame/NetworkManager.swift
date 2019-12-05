//
//  NetworkManager.swift
//  JeopardyGame
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func loadCategories(completed: @escaping (Data) -> ()) {
        
        guard let url = URL(string: K.JSONService.catetoriesURL) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }

            print ("Data: \(String(bytes: data, encoding: .utf8)!)")

            completed(data)
        }

        task.resume()
    }
    
    func loadClues(completed: @escaping (Data) -> ()) {

        guard let url = URL(string: K.JSONService.cluesURL) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }

            print ("Data: \(String(bytes: data, encoding: .utf8)!)")

            completed(data)
        }

        task.resume()
    }
}
