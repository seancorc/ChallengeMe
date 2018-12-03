//
//  PersonViewController.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/19/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    var person: User!
    var profilePictureView: UIImageView!
    var nameLabel: UILabel!
    var challengesCompletedLabel: UILabel!
    var streakLabel: UILabel!
    var numberOfChallengesLabel: UILabel!
    var streakNumberLabel: UILabel!
    var Vline: UIImageView!
    var Hline:UIImageView!
    var check: UIImageView!
    var fire: UIImageView!
    var orangeRect: UIImageView!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getuserInfo()
        
        
        view.backgroundColor = .white
        
        
        Vline = UIImageView(image: UIImage(named: "Vline"))
        Vline.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(Vline)
        
        Hline = UIImageView(image: UIImage(named: "Hline"))
        Hline.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(Hline)
        
        check = UIImageView(image: UIImage(named: "check"))
        check.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(check)
        
        fire = UIImageView(image: UIImage(named: "fire"))
        fire.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fire)
        
        orangeRect = UIImageView(image: UIImage(named: "Orange Rectangle"))
        orangeRect.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(orangeRect)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        self.view.addSubview(nameLabel)
        
        challengesCompletedLabel = UILabel()
        challengesCompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        challengesCompletedLabel.sizeToFit()
        challengesCompletedLabel.text = "Challenges Completed"
        challengesCompletedLabel.textColor = .black
        challengesCompletedLabel.textAlignment = .center
        challengesCompletedLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.view.addSubview(challengesCompletedLabel)
        
        streakLabel = UILabel()
        streakLabel.translatesAutoresizingMaskIntoConstraints = false
        streakLabel.text = "Streak"
        streakLabel.sizeToFit()
        streakLabel.textColor = .black
        streakLabel.textAlignment = .center
        streakLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.view.addSubview(streakLabel)
        
        streakNumberLabel = UILabel()
        streakNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        streakNumberLabel.sizeToFit()
        streakNumberLabel.textColor = .black
        streakNumberLabel.textAlignment = .center
        streakNumberLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        self.view.addSubview(streakNumberLabel)
        
        self.view.addSubview(challengesCompletedLabel)
        numberOfChallengesLabel = UILabel()
        numberOfChallengesLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfChallengesLabel.sizeToFit()
        numberOfChallengesLabel.textColor = .black
        numberOfChallengesLabel.textAlignment = .center
        numberOfChallengesLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        self.view.addSubview(numberOfChallengesLabel)
        
        
        
        

        profilePictureView = UIImageView()
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.layer.masksToBounds = true
        profilePictureView.layer.cornerRadius = 75
        self.view.addSubview(profilePictureView)
        
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            orangeRect.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orangeRect.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orangeRect.topAnchor.constraint(equalTo: view.topAnchor),
            orangeRect.bottomAnchor.constraint(equalTo: profilePictureView.centerYAnchor)
            
            ])
        
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
            challengesCompletedLabel.trailingAnchor.constraint(equalTo: Vline.leadingAnchor, constant: -8),
            challengesCompletedLabel.centerYAnchor.constraint(equalTo: Vline.bottomAnchor, constant: -16),
            ])
        
        NSLayoutConstraint.activate([
            streakLabel.leadingAnchor.constraint(equalTo: Vline.trailingAnchor, constant: 8),
            streakLabel.centerYAnchor.constraint(equalTo: Vline.bottomAnchor, constant: -16),
            ])
        
        NSLayoutConstraint.activate([
            numberOfChallengesLabel.centerXAnchor.constraint(equalTo: challengesCompletedLabel.centerXAnchor),
            numberOfChallengesLabel.bottomAnchor.constraint(equalTo: challengesCompletedLabel.topAnchor, constant: -16),
            ])
        
        NSLayoutConstraint.activate([
            streakNumberLabel.leadingAnchor.constraint(equalTo: fire.trailingAnchor, constant: 8),
            streakNumberLabel.bottomAnchor.constraint(equalTo: streakLabel.topAnchor, constant: -16),
            ])
        
        
        NSLayoutConstraint.activate([
            Vline.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Vline.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height/8),
            Vline.widthAnchor.constraint(equalToConstant: 10),
            Vline.heightAnchor.constraint(equalToConstant: 75)
            ])
        
        NSLayoutConstraint.activate([
            Hline.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Hline.topAnchor.constraint(equalTo: Vline.bottomAnchor, constant: -8),
            Hline.widthAnchor.constraint(equalToConstant: 350),
            Hline.heightAnchor.constraint(equalToConstant: 10)
            ])
        
        NSLayoutConstraint.activate([
            check.trailingAnchor.constraint(equalTo: numberOfChallengesLabel.leadingAnchor, constant: -8),
            check.centerYAnchor.constraint(equalTo: numberOfChallengesLabel.centerYAnchor),
            check.widthAnchor.constraint(equalToConstant: 30),
            check.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            fire.leadingAnchor.constraint(equalTo: Vline.trailingAnchor, constant: 8),
            fire.centerYAnchor.constraint(equalTo: streakNumberLabel.centerYAnchor),
            fire.widthAnchor.constraint(equalToConstant: 30),
            fire.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    
    func getuserInfo() {
        NetworkManager.getAUser(user_id: (VariablesInstance.user?.id)!, completion: { (user,image)  in
            DispatchQueue.main.async {
                
            self.person = user
            self.streakNumberLabel.text = "\(self.person.streak)"
            self.numberOfChallengesLabel.text = "\(self.person.count_completed_challenges)"
            self.nameLabel.text = "\(self.person.username)"
            self.profilePictureView.image = image
            }

        })
    }


}
