//
//  InlineModel.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct InlineModel: Decodable {
    var interest: Resources?
    var some: Resources?
    var all: Resources?
    var pregnant: Resources?
    
    private enum CodingKeys: String, CodingKey {
        case interest = "Interest"
        case some = "Some"
        case all = "All"
        case pregnant = "Pregnant"
    }
}
