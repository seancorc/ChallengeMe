//
//  File.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/19/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation
import UIKit



struct usersResponse: Codable {
    var data: [User]
}

struct singleUserResponse: Codable {
    var data: User
}


struct User: Codable {
    var count_completed_challenges: Int
    var id: Int
    var last_completed_challenge: Int
    var pic: String
    var streak: Int
    var username: String
}




