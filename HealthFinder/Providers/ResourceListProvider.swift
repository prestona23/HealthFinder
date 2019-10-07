//
//  ResourceListProvider.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

final class ResourceListProvider {
    
    private var resources: [Resource]
    
    convenience init() {
        self.init(resources: [])
    }
    
    init(resources: [Resource]) {
        self.resources = resources
    }
    
    func resourceCount() -> Int {
        return resources.count
    }
    
    func resourceAt(index: Int) -> Resource? {
        guard index >= 0 && index < resources.count else {
            return nil
        }
        
        return resources[index]
    }
    
    func refreshResources(resources: [Resource]) {
        self.resources.removeAll()
        self.resources.append(contentsOf: resources)
    }
}
