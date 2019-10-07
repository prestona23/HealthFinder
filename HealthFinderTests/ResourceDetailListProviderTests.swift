//
//  ResourceDetailListProviderTests.swift
//  HealthFinderTests
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import XCTest

class ResourceDetailListProviderTests: XCTestCase {

    func testConvienceInitSectionCount() {
        //Given
        let resourceDetailListProvider = ResourceDetailListProvider()
        
        //When
        let sectionCount = resourceDetailListProvider.sectionCount()
        
        //Then
        XCTAssertEqual(sectionCount, 0)
    }
    
    func testConvienceInitSectionAtIndexZero() {
        //Given
        let resourceDetailListProvider = ResourceDetailListProvider()
        
        //When
        let sectionAtZeroIndex = resourceDetailListProvider.sectionAt(index: 0)
        
        //Then
        XCTAssertNil(sectionAtZeroIndex)
    }
    
    func testSectionCount() {
        //Given
        let sections = [Section()]
        let resourceDetailListProvider = ResourceDetailListProvider(sections: sections)
        
        //When
        let sectionCount = resourceDetailListProvider.sectionCount()
        
        //Then
        XCTAssertEqual(sectionCount, 1)
    }
    
    func testResourceIndexOutOfBoundsShouldReturnNil() {
        
        //Given
        let sections = [Section()]
        let resourceDetailListProvider = ResourceDetailListProvider(sections: sections)
        
        //When
        let section = resourceDetailListProvider.sectionAt(index: 5)
        
        //Then
        XCTAssertNil(section)
        
    }
    
    func testResourceIndexLessThanZeroShouldReturnNil() {
        //Given
        let sections = [Section()]
        let resourceDetailListProvider = ResourceDetailListProvider(sections: sections)
        
        //When
        let section = resourceDetailListProvider.sectionAt(index: -5)
        
        //Then
        XCTAssertNil(section)
    }

}
