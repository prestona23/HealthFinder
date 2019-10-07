//
//  MyHealthFinderResult.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct MyHealthFinderResult: Decodable {
    var error: String?
    var resources: InlineModel?
    
    private enum CodingKeys: String, CodingKey {
        case error = "Error"
        case resources = "Resources"
    }
}
