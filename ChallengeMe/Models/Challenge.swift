//
//  Challenge.swift
//  ChallengeMe
//
//  Created by John Smith on 11/20/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation


struct challengeResponse: Codable {
    var data: [Challenge]
}

struct Challenge: Codable {
    var id: Int
    var imgURL: String
    var text: String
    var timeToFinish: String
}


