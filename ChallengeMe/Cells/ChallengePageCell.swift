//
//  ChallengeViewController.swift
//  ChallengeMe
//
//  Created by John Smith on 11/25/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit
import FLAnimatedImage
// This is the "Start Challenge" screen

protocol ButtonDelegate: class {
    func acceptButtonWasTapped()
    func cancelButtonWasTapped()
    func completedButtonWasTapped(tag: Int)
}


class ChallengePageCell: UICollectionViewCell {
    var challenge: Challenge!
    var timerLabel: UILabel!
    var timer: Timer!
    var time: Int!
    var timeCopy: Int!
    var isTimerRunning = false
    var acceptButton: UIButton!
    var cancelButton: UIButton!
    var completedButton: UIButton!
    weak var acceptedDelegate: ButtonDelegate?
    weak var canceledDelegate: ButtonDelegate?
    weak var completedDelegate: ButtonDelegate?
    var challengeLabel: UILabel!
    var challengeImageView: UIImageView!
    var recordedTime: String? = "5 Years"
    var gifImageView: FLAnimatedImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        
        
        acceptButton = UIButton()
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.setTitleColor(.orange, for: .normal)
        acceptButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 28)
        acceptButton.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.8)
        acceptButton.layer.masksToBounds = true
        acceptButton.layer.cornerRadius = 10
        acceptButton.layer.borderColor = UIColor.lightGray.cgColor
        acceptButton.layer.borderWidth = 2
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        addSubview(acceptButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.orange, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 28)
        cancelButton.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.8)
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        cancelButton.layer.borderWidth = 2
        cancelButton.isHidden = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        addSubview(cancelButton)
        
        timerLabel = UILabel()
        timerLabel.textColor = UIColor.orange
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        timerLabel.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.8)
        timerLabel.layer.masksToBounds = true
        timerLabel.layer.cornerRadius = 10
        timerLabel.layer.borderColor = UIColor.lightGray.cgColor
        timerLabel.layer.borderWidth = 2
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timerLabel)
        
        completedButton = UIButton()
        completedButton.setTitle("Challenge Completed", for: .normal)
        completedButton.isHidden = true
        completedButton.setTitleColor(.orange, for: .normal)
        completedButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 28)
        completedButton.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.8)
        completedButton.layer.masksToBounds = true
        completedButton.layer.cornerRadius = 10
        completedButton.layer.borderColor = UIColor.lightGray.cgColor
        completedButton.layer.borderWidth = 2
        completedButton.translatesAutoresizingMaskIntoConstraints = false
        completedButton.addTarget(self, action: #selector(completedButtonTapped), for: .touchUpInside)
        addSubview(completedButton)
        
        
        challengeLabel = UILabel()
        challengeLabel.translatesAutoresizingMaskIntoConstraints = false
        challengeLabel.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.8)
        challengeLabel.layer.masksToBounds = true
        challengeLabel.layer.cornerRadius = 10
        challengeLabel.layer.borderColor = UIColor.lightGray.cgColor
        challengeLabel.layer.borderWidth = 2
        challengeLabel.textColor = UIColor.orange
        challengeLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        challengeLabel.textAlignment = .center
        challengeLabel.lineBreakMode = .byWordWrapping
        challengeLabel.numberOfLines = 20
        addSubview(challengeLabel)
        
        challengeImageView = UIImageView()
        addSubview(challengeImageView)
        
        
        
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        
        
        NSLayoutConstraint.activate([
            timerLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -contentView.frame.width / 2 + 24),
            timerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant:-contentView.frame.height / 8),
            timerLabel.widthAnchor.constraint(equalToConstant: 300),
            timerLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            acceptButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            acceptButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.width / 8),
            acceptButton.widthAnchor.constraint(equalToConstant: 150)
            ])
        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cancelButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.width / 8),
            cancelButton.widthAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            challengeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            challengeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -contentView.frame.height / 4),
            challengeLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 48)
            ])
        NSLayoutConstraint.activate([
            challengeImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            challengeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.height / 4)
            ])
        NSLayoutConstraint.activate([
            completedButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            completedButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.width / 3),
            completedButton.widthAnchor.constraint(equalToConstant: 400)
            ])
    }
    
    
    
    
    
    
    func configure() {
        challengeLabel.text = challenge.text
        
        if challenge.timeToFinish == "five_minutes" {
            time = 300
            timeCopy = 300
            timerLabel.text = "   Timer:           0\(time / 3600): 0\((time % 3600)/60) : \((time % 3600)%60)0"

        }
        if challenge.timeToFinish == "six_hours" {
            time = 21600
            timeCopy = 21600
            timerLabel.text = "   Timer:           0\(time / 3600): 0\((time % 3600)/60) : \((time % 3600)%60)0"

        }
        if challenge.timeToFinish == "one_day" {
            time = 86400
            timeCopy = 86400
            timerLabel.text = "   Timer:           \(time / 3600): 0\((time % 3600)/60) : \((time % 3600)%60)0"

        }
        
        gifImageView = FLAnimatedImageView()
        NetworkManager.getChallengeGif(url: self.challenge.imgURL) { (data) in
            let gif = FLAnimatedImage.init(animatedGIFData: data)
            self.gifImageView.animatedImage = gif
            self.backgroundView = self.gifImageView
        }
        

    }
    
    
    // STUFF FOR THE TIMER
    // TODO: Change seconds to the time from the individual challenge
    
    @objc func acceptButtonTapped() {
        NetworkManager.startChallenge(challenge_id: self.challenge.id, user_id: VariablesInstance.user!.id) { (user) in
            
        }
        
        runTimer()
        acceptButton.isHidden = true
        cancelButton.isHidden = false
        completedButton.isHidden = false
        acceptedDelegate?.acceptButtonWasTapped()
        
    }
    
    @objc func cancelButtonTapped() {
        timeCopy = time
        cancelButton.isHidden = true
        acceptButton.isHidden = false
        completedButton.isHidden = true
        timer.invalidate()
        if time == 86400 {
            timerLabel.text = "   Timer:           \(timeCopy / 3600): 0\((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)0"
        }
        else {
            timerLabel.text = "   Timer:           0\(timeCopy / 3600): 0\((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)0"
            
        }

        isTimerRunning = false
        canceledDelegate?.cancelButtonWasTapped()
    }
    
    @objc func completedButtonTapped(_ target: UIButton) {
        NetworkManager.completeChallenge(challenge_id: self.challenge!.id, user_id: VariablesInstance.user!.id) { (user) in
            
        }
        completedButton.isHidden = true
        timeCopy = time
        cancelButton.isHidden = true
        acceptButton.isHidden = false
        timer.invalidate()
        if time == 86400 {
            timerLabel.text = "   Timer:           \(timeCopy / 3600): 0\((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)0"
        }
        else {
            timerLabel.text = "   Timer:           0\(timeCopy / 3600): 0\((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)0"
            
        }
        isTimerRunning = false
        canceledDelegate?.cancelButtonWasTapped()
        completedDelegate?.completedButtonWasTapped(tag: self.tag)
        
        
    }
    
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        timeCopy -= 1
        if time == 86400 {
        timerLabel.text = "   Timer:           \(timeCopy / 3600): \((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)"
        }
        else {
            timerLabel.text = "   Timer:           0\(timeCopy / 3600): \((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)"

        }
        recordedTime =  "\(timeCopy / 3600): \((timeCopy % 3600)/60) : \((timeCopy % 3600)%60)"
        if ( timeCopy == 0 ) {
            timer.invalidate()
            timerLabel.text = "   Timer:           0\(time / 3600): 0\((time % 3600)/60) : \((time % 3600)%60)0"
            isTimerRunning = false
            canceledDelegate?.cancelButtonWasTapped()
        }
    }
    
    
   
    
}
