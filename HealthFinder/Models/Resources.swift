//
//  Resources.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct Resources: Decodable {
    var resource: [Resource]?
    
    private enum CodingKeys: String, CodingKey {
        case resource = "Resource"
    }
}
