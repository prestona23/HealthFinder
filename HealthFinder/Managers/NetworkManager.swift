//
//  NetworkManager.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    private final let baseHealthFinderPath = "https://healthfinder.gov/api/v2/myhealthfinder.json"
    private final let apiKey = "demo_api_key"
    
    func getHealthFinderResultsFor(age: String, sex: String, completion: @escaping (HealthFinderResult<MyHealthFinderService>) -> Void) {
        
        guard let url = URL(string: baseHealthFinderPath+"?api_key="+apiKey+"&age="+age+"&sex="+sex) else {
            return
        }
        print(url.absoluteString)
        Alamofire.request(url, method: .get).responseData { (response) in
            if let responseError = response.error {
                completion(.failure(responseError))
                return
            }
            
            switch response.result {
            case .success(let data):
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(MyHealthFinderService.self, from: data)
                    
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
