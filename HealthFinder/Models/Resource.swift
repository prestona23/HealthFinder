//
//  Resource.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct Resource: Decodable {
    var type: String?
    var id: String?
    var title: String?
    var translationId: String?
    var translationTitle: String?
    var imageUrl: String?
    var imageAlt: String?
    var sections: Sections?
    
    private enum CodingKeys: String, CodingKey {
        case type = "Type"
        case id = "Id"
        case title = "Title"
        case translationId = "TranslationId"
        case translationTitle = "TranslationTitle"
        case imageUrl = "ImageUrl"
        case imageAlt = "ImageAlt"
        case sections = "Sections"
    }
}
