//
//  NetworkManagerTests.swift
//  HealthFinderTests
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import XCTest

class NetworkManagerTests: XCTestCase {

    func testNetworkManagerSuccess() {
        //Given
        let expectation = XCTestExpectation(description: "Get resource from server.")
        var result: HealthFinderResult<MyHealthFinderService>?
        
        //When
        NetworkManager().getHealthFinderResultsFor(age: "25", sex: "Male") { (results) in
            result = results
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: TimeInterval(100))
        
        //Then
        guard let testResult = result else {
            XCTFail()
            return
        }
        XCTAssertTrue(testResult.isSuccess)
        
    }

}
