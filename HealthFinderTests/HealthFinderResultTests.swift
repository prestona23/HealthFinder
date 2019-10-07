//
//  HealthFinderResultTests.swift
//  HealthFinderTests
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import XCTest

class HealthFinderResultTests: XCTestCase {

    enum TestableError: Error {
        case testableError
    }
    
    func testSuccessResult() {
        //Given - When
        let result = HealthFinderResult<String>.success("Success")
        
        //Then
        XCTAssertTrue(result.isSuccess)
    }
    
    func testFailureResult() {
        //Given - When
        let result = HealthFinderResult<String>.failure(TestableError.testableError)
        
        XCTAssertTrue(result.isFailure)
    }

}
