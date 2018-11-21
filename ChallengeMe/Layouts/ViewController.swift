//
//  ViewController.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/18/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

// This is the "Start Challenge" screen

class ViewController: UIViewController {
    
    var startButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Get Challenged M8"
        view.backgroundColor = .white
        
        startButton.setTitle("Challenge Yourself", for: .normal)
        startButton.setTitleColor(.red, for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        //        startButton.addTarget(self, action: #selector(pushRedArenaViewController), for: .touchUpInside)
        view.addSubview(startButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

