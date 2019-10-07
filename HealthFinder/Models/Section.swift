//
//  Section.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct Section: Decodable {
    var title: String?
    var description: String?
    var content: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "Description"
        case content = "Content"
    }
}
