//
//  ChallengeActivity.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 12/2/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation

struct challengeActivityResponse: Codable {
    var data: ChallengeActivty
}

struct ChallengeActivty: Codable {
    var endFinishTime: String
    var id: Int
    var startTime: String
    var toFinishTime: String
}
