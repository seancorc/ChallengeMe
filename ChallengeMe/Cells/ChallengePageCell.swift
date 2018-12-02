//
//  ChallengeViewController.swift
//  ChallengeMe
//
//  Created by John Smith on 11/25/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

// This is the "Start Challenge" screen

protocol ButtonDelegate: class {
    func acceptButtonWasTapped()
    func cancelButtonWasTapped()
}

class ChallengePageCell: UICollectionViewCell {
    var timerLabel: UILabel!
    var timer: Timer!
    var seconds = 60
    var secondsCopy = 60
    var isTimerRunning = false
    var acceptButton: UIButton!
    var cancelButton: UIButton!
    weak var acceptedDelegate: ButtonDelegate?
    weak var canceledDelegate: ButtonDelegate?
    var challengeLabel: UILabel!
    var challengeImageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIImageView(image: UIImage(named: "Orange Rectangle"))
        
        acceptButton = UIButton()
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 28)
        acceptButton.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        acceptButton.layer.masksToBounds = true
        acceptButton.layer.cornerRadius = 10
        acceptButton.layer.borderColor = UIColor.lightGray.cgColor
        acceptButton.layer.borderWidth = 2
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        addSubview(acceptButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 28)
        cancelButton.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        cancelButton.layer.borderWidth = 2
        cancelButton.isHidden = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        addSubview(cancelButton)
        
        timerLabel = UILabel()
        timerLabel.text = "   Timer:           \(seconds)"
        timerLabel.textColor = UIColor.white
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        timerLabel.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        timerLabel.layer.masksToBounds = true
        timerLabel.layer.cornerRadius = 10
        timerLabel.layer.borderColor = UIColor.lightGray.cgColor
        timerLabel.layer.borderWidth = 2
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timerLabel)
        
        
        challengeLabel = UILabel()
        challengeLabel.translatesAutoresizingMaskIntoConstraints = false
        //challengeLabel.text = "Insert Challenge Here"
        challengeLabel.textColor = UIColor.white
        challengeLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 34)
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
            challengeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -contentView.frame.height / 4)
            ])
        NSLayoutConstraint.activate([
            challengeImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            challengeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.height / 4)
            ])
    }
    
    func configure(for challenge: Challenge) {
        challengeLabel.text = challenge.text
        //challengeImageView.image = UIImage(cgImage: Challenge.imgURL)
    }
    
    
    // STUFF FOR THE TIMER
    // TODO: Change seconds to the time from the individual challenge
    
    @objc func acceptButtonTapped() {
        acceptButton.isHidden = true
        cancelButton.isHidden = false
        acceptedDelegate?.acceptButtonWasTapped()
        runTimer()
        
    }
    
    @objc func cancelButtonTapped() {
        secondsCopy = seconds
        cancelButton.isHidden = true
        acceptButton.isHidden = false
        timer.invalidate()
        timerLabel.text = "   Timer:           \(seconds)"
        isTimerRunning = false
        canceledDelegate?.cancelButtonWasTapped()
    }
    
    

    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
  }

    @objc func updateTimer() {
        secondsCopy -= 1
        timerLabel.text = "   Timer:           \(secondsCopy)"
    }
    
    

}
