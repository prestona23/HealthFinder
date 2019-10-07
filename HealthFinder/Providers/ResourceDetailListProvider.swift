//
//  ResourceDetailListProvider.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

final class ResourceDetailListProvider {
    
    private var sections: [Section]
    
    convenience init() {
        self.init(sections: [])
    }
    
    init(sections: [Section]) {
        self.sections = sections
    }
    
    func sectionCount() -> Int {
        return sections.count
    }
    
    func sectionAt(index: Int) -> Section? {
        guard index >= 0 && index < sections.count else {
            return nil
        }
        
        return sections[index]
    }
    
    func refreshSections(sections: [Section]) {
        self.sections.removeAll()
        self.sections.append(contentsOf: sections)
    }
}
