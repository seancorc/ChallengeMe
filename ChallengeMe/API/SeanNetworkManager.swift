//
//  NetworkManager.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 12/1/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation
import Alamofire

private let userEndpoint = "http://localhost:5000/api/users/"

class NetworkManager {

static func getUser(completion: @escaping ([Person]) -> Void) {
    Alamofire.request(endpoint, method: .get).validate().responseData { (response) in
        switch response.result {
        case .success(let data):
            // If you still want to see the JSON response
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                print(json)
            }
            // Create the JSON decoder
            let jsonDecoder = JSONDecoder()
            // Mention .convertFromSnakeCase
            // jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            // Since the format of the data is { "data": { "classes": { [...] } }
            // we need to get inside those two layers of json to decode the classes data
            // into Course objects by first decoding the CourseResponse
            if let courseResponse = try? jsonDecoder.decode(CourseResponse.self, from: data) {
                // Call the function we passed in to do whatever we want
                // to the classes array (eg. show it on screen)
                completion(courseResponse.data.classes)
            } else {
                print("Invalid Response Data")
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

}
