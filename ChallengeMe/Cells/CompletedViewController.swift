//
//  CompletedViewController.swift
//  ChallengeMe
//
//  Created by Library User on 12/2/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {
    
    var challenge: Challenge!
    var niceLabel: UILabel!
    var congratsLabel: UILabel!
    var time: String = "5 Years"
    var background: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        background = UIImageView(image: UIImage(named: "Orange Rectangle"))
        background.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(background)
        
        congratsLabel = UILabel()
        congratsLabel.translatesAutoresizingMaskIntoConstraints = false
        congratsLabel.textColor = UIColor.white
        congratsLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        if challenge.timeToFinish == "five_minutes" {
            time = "Five Minutes"
        }
        if challenge.timeToFinish == "six_hours" {
            time = "Six Hours"
        }
        if challenge.timeToFinish == "one_day" {
            time = "One Day"
        }
        congratsLabel.text = "CHALLENGE COMPLETED \n\(challenge.text) \n\nYou Did It In Under \n\(time) \n\nChallengeMe again!"
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
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    
    
}
