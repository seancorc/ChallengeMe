//
//  File.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/19/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation
import UIKit



    struct userResponse: Codable {
        
    }

    struct userDataResponse: Codable {
        var count_completed_challenges: Int
        var id: Int
        var last_completed_challenge: Int
        var password: String
        var streak: Int
        var username: String
    }




