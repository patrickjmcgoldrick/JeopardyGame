//
//  CategoryParser.swift
//  JeopardyGame
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import Foundation

final class CategoryParser {
    
    func parse(data: Data, parsed: @escaping ([CategoryData]) -> Void) {
                
        // background the loading / parsing elements
        DispatchQueue.global(qos: .userInitiated).async {

            do {
                // create decoder
                let jsonDecoder = JSONDecoder()

                // decode json into structs
                let categoryData = try jsonDecoder.decode([CategoryData].self, from: data)
                
                parsed(categoryData)
                               
            } catch {
                print ("Error Parsing JSON: \(error.localizedDescription)")
            }
        }
    }
}
