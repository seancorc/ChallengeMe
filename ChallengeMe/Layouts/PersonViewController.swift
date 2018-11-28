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
    var line: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        person = Person(firstName: "first", lastName: "last", profilePicture: nil, challengesCompleted: 0)
        
        line = UIImageView(image: UIImage(named: "line"))
        line.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(line)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "First     Last"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        self.view.addSubview(nameLabel)
        
        challengesCompletedLabel = UILabel()
        challengesCompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        challengesCompletedLabel.text = "Challenges Completed: \(person.challengesCompleted)"
        challengesCompletedLabel.textColor = .black
        challengesCompletedLabel.textAlignment = .center
        challengesCompletedLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.view.addSubview(challengesCompletedLabel)
        
        
        
        if let profilePicture = person.profilePicture {
            profilePictureView = UIImageView(image: profilePicture)
        }
        else {
            profilePictureView = UIImageView(image: UIImage(named: "Default Profile Picture"))
        }
        
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.layer.masksToBounds = true
        profilePictureView.layer.cornerRadius = 75
        self.view.addSubview(profilePictureView)
        
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 500),
            nameLabel.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            profilePictureView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePictureView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/8),
            profilePictureView.widthAnchor.constraint(equalToConstant: 150),
            profilePictureView.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            challengesCompletedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            challengesCompletedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height / 6),
            challengesCompletedLabel.widthAnchor.constraint(equalToConstant: 500),
            challengesCompletedLabel.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height/8),
            line.widthAnchor.constraint(equalToConstant: 3),
            line.heightAnchor.constraint(equalToConstant: 100)
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
