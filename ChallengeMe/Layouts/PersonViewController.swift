//
//  PersonViewController.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/19/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    var person: Person!
    var profilePictureView: UIImageView!
    var nameLabel: UILabel!
    var challengesCompletedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "first last"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.view.addSubview(nameLabel)
        
        
        
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height / 6),
            nameLabel.widthAnchor.constraint(equalToConstant: 500),
            nameLabel.heightAnchor.constraint(equalToConstant: 100)
            ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
