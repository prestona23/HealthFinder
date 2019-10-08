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
    
    /// Convience init to initialize with a blank set of resources.
    convenience init() {
        self.init(resources: [])
    }
    
    /// Initialize with a set of resources.
    init(resources: [Resource]) {
        self.resources = resources
    }
    
    /// Return the number of resources.
    func resourceCount() -> Int {
        return resources.count
    }
    
    /// Return a resource at the give index. A null resource is returned if the index is out of bounds.
    /// - Parameters:
    ///    - index: The index you are looking to retrieve.
    func resourceAt(index: Int) -> Resource? {
        guard index >= 0 && index < resources.count else {
            return nil
        }
        
        return resources[index]
    }
    
    /// Replace the resources with a new set of resources.
    /// - Parameters:
    ///    - resources: The new resources to replace.
    func refreshResources(resources: [Resource]) {
        self.resources.removeAll()
        self.resources.append(contentsOf: resources)
    }
}
