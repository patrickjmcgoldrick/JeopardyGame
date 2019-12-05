//
//  ClueData.swift
//  JeopardyGame
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import Foundation

struct ClueData: Codable {
    let id: Int
    let answer: String
    let question: String
    let value: Int?  // Sometimes missing in the data, so Optional
    let category_id: Int
}  // TODO: do we need an default for value?
