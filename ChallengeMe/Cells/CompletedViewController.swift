//
//  CompletedViewController.swift
//  ChallengeMe
//
//  Created by Library User on 12/2/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {
    
    var niceLabel: UILabel!
    var congratsLabel: UILabel!
    var challenge: String = "Learning the Tango"
    var time: String = "5 Years"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        congratsLabel = UILabel()
        congratsLabel.translatesAutoresizingMaskIntoConstraints = false
        congratsLabel.textColor = UIColor.white
        congratsLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        congratsLabel.text = "CHALLENGE COMPLETED \n \(challenge) \n\nYou Did It In Under \n\(time) \n\n\n\n Bodacious levels increased by 42% \n\n ChallengeMe again!"
        congratsLabel.lineBreakMode = .byWordWrapping
        congratsLabel.numberOfLines = 20
        view.addSubview(congratsLabel)
        
        niceLabel = UILabel()
        niceLabel.translatesAutoresizingMaskIntoConstraints = false
        niceLabel.textColor = UIColor.white
        niceLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 34)
        niceLabel.text = "NICE!"
        view.addSubview(niceLabel)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            congratsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            congratsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            niceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            niceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height / 4)
            ])
    }
    
    
    
}
