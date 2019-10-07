//
//  MyHealthFinderService.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct MyHealthFinderService: Decodable {
    var result: MyHealthFinderResult?
    
    private enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}
