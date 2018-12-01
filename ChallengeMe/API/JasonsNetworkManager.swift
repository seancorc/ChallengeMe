//
//  NetworkManager.swift
//  ChallengeMe
//
//  Created by Library User on 12/1/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation
import AlamoFire

class NetworkManager: NSObject {
    
    let localhost: String = "https://localhost:5000"
    private static let challengeEndpoint = localhost + "/api/challenges/"
    
    static func getRandomChallenge(completion: @escaping ([Challenge])-> Void) {
        Alamofire.request(challengeEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                // If you still want to see the JSON response
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                // Create the JSON decoder
                let jsonDecoder = JSONDecoder()
                
                if let challengeResponse = try? jsonDecoder.decode(ChallengeResponse.self, from: data) {
                    fetchChallengeGif(imageURL: challengeResponse)
                    completion(challengeResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    static func fetchChallengeGif(imageURL: String, completion: @escaping (UIImage) -> Void) {
        Alamofire.request(imageURL).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let gif = UIImage(data: data) {
                    completion(gif)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
