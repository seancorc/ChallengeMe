//
//  Challenge.swift
//  ChallengeMe
//
//  Created by John Smith on 11/20/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation

struct ChallengeResponse: Codable{
    var data: [Challenge]
}

struct Challenge: Codable {
    var id: Int
    var text: String
    var imgURL: String
    var timeToFinish: String
}
