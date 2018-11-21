//
//  Challenge.swift
//  ChallengeMe
//
//  Created by John Smith on 11/20/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class Challenge {
    
    var title: String
    var gif: UIImage
    var time: Int
    
    init(title: String, gif: UIImage, time: Int) {
        self.title = title 
        self.gif = gif
        self.time = time
    }

    
}
