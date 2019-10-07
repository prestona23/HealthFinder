//
//  Sections.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct Sections: Decodable {
    var section: [Section]?
    
    private enum CodingKeys: String, CodingKey {
        case section = "Section"
    }
}
