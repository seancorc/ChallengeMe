//
//  ViewController.swift
//  ChallengeMe
//
//  Created by John Smith on 11/25/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Challenge Start Page"
        view.backgroundColor = .white
        
        randomButton.setTitle("Random Challenge", for: .normal)
        randomButton.setTitleColor(.red, for: .normal)
        randomButton.translatesAutoresizingMaskIntoConstraints = false
        randomButton.addTarget(self, action: #selector(pushChallengeViewController), for: .touchUpInside)
        view.addSubview(randomButton)
        
        
        // Constraints
        
        let spacing: CGFloat = 40
        
        randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        randomButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -spacing).isActive = true
        
    }
    
    /// Pushes a new Challenge view controller to present a random challenge
    @objc func pushChallengeViewController(_ target: UIButton) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let challengeViewController = ChallengeViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(challengeViewController, animated: true)
        
        
        // Change title from being default back button text
//        let backButton = UIBarButtonItem()
//        backButton.title = "Back"
//        navigationItem.backBarButtonItem = backButton
        
    }
    
//    @objc func dismissViewController() {
//        dismiss(animated: true)
//    }
//
//
    
    
}

