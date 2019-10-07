//
//  HealthFinderResult.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

enum HealthFinderResult<Value> {
    case success(Value)
    case failure(Error)
    
    /// Computed property for determining success. (H/T Alamofire)
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    
    /// Computed property for determining failure. (H/T Alamofire)
    var isFailure: Bool {
        return !isSuccess
    }
}
