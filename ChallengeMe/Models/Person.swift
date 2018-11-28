//
//  File.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/19/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation
import UIKit


//struct Person: Codable {
//
//    var firstName: String
//    var lastName: String
//    var profilePicture: Data
//    var challengesCompleted: Int
//
////    init(firstName: String, lastName: String, profilePicture: UIImage?, challengesCompleted: Int) {
////        self.firstName = firstName
////        self.lastName = lastName
////        self.profilePicture = profilePicture
////        self.challengesCompleted = challengesCompleted
////
////    }
//
//
//}

class Person {
    
    var firstName: String
    var lastName: String
    var profilePicture: UIImage?
    var challengesCompleted: Int
    var streak: Int

    init(firstName: String, lastName: String, profilePicture: UIImage?, challengesCompleted: Int, streak: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.profilePicture = profilePicture
        self.challengesCompleted = challengesCompleted
        self.streak = streak

    }

}
