//
//  CategoryData.swift
//  JeopardyGame
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import Foundation

struct CategoryData: Codable {
    let id: Int
    let title: String
    let clues_count: Int
}
