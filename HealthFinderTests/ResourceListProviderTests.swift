//
//  ResourceListProviderTests.swift
//  HealthFinderTests
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import XCTest

class ResourceListProviderTests: XCTestCase {

    func testConvienceInitResourceCount() {
        //Given
        let resourceListProvider = ResourceListProvider()
        
        //When
        let resourceCount = resourceListProvider.resourceCount()
        
        //Then
        XCTAssertEqual(resourceCount, 0)
    }
    
    func testConvienceInitResourceAtIndexZero() {
        //Given
        let resourceListProvider = ResourceListProvider()
        
        //When
        let resourceAtZeroIndex = resourceListProvider.resourceAt(index: 0)
        
        //Then
        XCTAssertNil(resourceAtZeroIndex)
    }
    
    func testResourceCount() {
        //Given
        let resources = [Resource()]
        
        let resourceListProvider = ResourceListProvider(resources: resources)
        
        //When
        let resourceCount = resourceListProvider.resourceCount()
        
        //Then
        XCTAssertEqual(resourceCount, 1)
    }
    
    func testResourceIndexOutOfBoundsShouldReturnNil() {
        
        //Given
        let resources = [Resource()]
        let resourceListProvider = ResourceListProvider(resources: resources)
        
        //When
        let resource = resourceListProvider.resourceAt(index: 5)
        
        //Then
        XCTAssertNil(resource)
        
    }
    
    func testResourceIndexLessThanZeroShouldReturnNil() {
        //Given
        let resources = [Resource()]
        let resourceListProvider = ResourceListProvider(resources: resources)
        
        //When
        let resource = resourceListProvider.resourceAt(index: -5)
        
        //Then
        XCTAssertNil(resource)
    }

}
