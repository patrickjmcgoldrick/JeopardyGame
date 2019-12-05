//
//  ClueParser.swift
//  JeopardyGame
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import Foundation

final class ClueParser {
    
    func parse(data: Data, parsed: @escaping ([ClueData]) -> Void) {
                    
        // background the loading / parsing elements
        DispatchQueue.global(qos: .userInitiated).async {

            print (data.description)
            
            do {
                // create decoder
                let jsonDecoder = JSONDecoder()

                // decode json into structs
                let clueData = try jsonDecoder.decode([ClueData].self, from: data)
                
                parsed(clueData)
                               
            } catch {
                print ("Error Parsing ClueData JSON: \(error.localizedDescription)")
            }
        }
        
    }
    
}
