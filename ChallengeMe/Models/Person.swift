//
//  File.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/19/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import Foundation
import UIKit


class Person {
    let firstName: String
    let lastName: String
    let profilePicture: UIImage
    let challengesCompleted: Int
    
    init(firstName: String, lastName: String, profilePicture: UIImage, challengesCompleted: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.profilePicture = profilePicture
        self.challengesCompleted = challengesCompleted
        
    }
    
    
}
