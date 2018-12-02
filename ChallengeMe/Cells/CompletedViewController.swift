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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        congratsLabel = UILabel()
        congratsLabel.translatesAutoresizingMaskIntoConstraints = false
        //congratsLabel.text = "Insert Challenge Here"
        congratsLabel.textColor = UIColor.white
        congratsLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        congratsLabel.text = "CHALLENGE COMPLETED \n Write a Letter to Your Future Self \n\nTIME SPENT \n Two Minutes \n\n\n\n You have now completed a total # of challenges \n\n ChallengeMe again!"
        addSubview(congratsLabel)
        
        niceLabel = UILabel()
        niceLabel.translatesAutoresizingMaskIntoConstraints = false
        //niceLabel.text = "Insert Challenge Here"
        niceLabel.textColor = UIColor.white
        niceLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 34)
        niceLabel.text = "NICE!"
        addSubview(niceLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            congratsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            congratsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            niceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            niceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -contentView.frame.height / 4)
            ])
    }
    
    
    
}
