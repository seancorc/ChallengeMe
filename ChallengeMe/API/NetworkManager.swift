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
private let challengeEndpoint = "http://localhost:5000/api/challenges/"
private let loginEndpoint = "http://localhost:5000/api/users/login/"



class NetworkManager {
    
    static func getUsers(completion: @escaping ([User]) -> Void) {
        
        Alamofire.request(userEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                // Create the JSON decoder
                let jsonDecoder = JSONDecoder()
                
                if let users = try? jsonDecoder.decode(usersResponse.self, from: data) {
                    
                    // Call the function we passed in to do whatever we want
                    // to the classes array (eg. show it on screen)
                    completion(users.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    static func getAUser(user_id: Int, completion: @escaping (User, UIImage) -> Void) {
        let parameters: [String:Any] = [
            "user_id": user_id,
            ]
        Alamofire.request(userEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(singleUserResponse.self, from: data) {
                    var profilePic: UIImage? = nil
                    getProfilePicture(url: user.data.pic, completion: { (image) in
                        profilePic = image
                        completion(user.data, (profilePic ?? UIImage(named: "Default Profile Picture")!))
                    })
                    
                    
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
     static func getProfilePicture(url: String, completion: @escaping (UIImage) -> Void) {
        Alamofire.request(url, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):

                if let pic = UIImage(data: data) {
                    completion(pic)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    //Fix This
    static func getChallenges(completion: @escaping ([Challenge]) -> Void) {
        
        Alamofire.request(challengeEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print("here")
                    print(json)
                }
                // Create the JSON decoder
                let jsonDecoder = JSONDecoder()
                
                if let challenges = try? jsonDecoder.decode(challengeResponse.self, from: data) {
                    completion(challenges.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getChallengeGif(url: String, completion: @escaping (Data) -> Void) {
        Alamofire.request(url, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    static func login(username: String, password: String, completion: @escaping (User) -> Void) {
        let parameters: [String:Any] = [
            "password": password,
            "username": username
            ]
        Alamofire.request(loginEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(singleUserResponse.self, from: data) {
                    completion(user.data)
                    
                    
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }




}
