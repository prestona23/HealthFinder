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
    
    /// Convience init to initialize with a blank set of sections.
    convenience init() {
        self.init(sections: [])
    }
    
    /// Initialize with a set of sections.
    init(sections: [Section]) {
        self.sections = sections
    }
    
    /// Return the number of sections.
    func sectionCount() -> Int {
        return sections.count
    }
    
    func sectionAt(index: Int) -> Section? {
        guard index >= 0 && index < sections.count else {
            return nil
        }
        
        return sections[index]
    }
    
    /// Replace the sections with a new set of resources.
    /// - Parameters:
    ///    - sections: The new sections to replace.
    func refreshSections(sections: [Section]) {
        self.sections.removeAll()
        self.sections.append(contentsOf: sections)
    }
}
