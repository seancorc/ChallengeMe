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
    var timerDescriptionLabel: UILabel!
    var challengeLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "orangeimage")!)
        
        acceptButton = UIButton()
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        addSubview(acceptButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.isHidden = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        addSubview(cancelButton)
        
        timerLabel = UILabel()
        timerLabel.text = "\(seconds)"
        timerLabel.textColor = UIColor.white
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        addSubview(timerLabel)
        
        timerDescriptionLabel = UILabel()
        timerDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        timerDescriptionLabel.text = "Timer:"
        timerDescriptionLabel.textColor = UIColor.white
        timerDescriptionLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        addSubview(timerDescriptionLabel)
        
        challengeLabel = UILabel()
        challengeLabel.translatesAutoresizingMaskIntoConstraints = false
        challengeLabel.text = "Insert Challenge Here"
        challengeLabel.textColor = UIColor.white
        challengeLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 34)
        addSubview(challengeLabel)
        


        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {

        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: timerDescriptionLabel.centerXAnchor, constant: 50),
            timerLabel.centerYAnchor.constraint(equalTo: timerDescriptionLabel.centerYAnchor)
            ])
        NSLayoutConstraint.activate([
            acceptButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            acceptButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.width / 8)
            ])
        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cancelButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.width / 8)
            
            ])
        NSLayoutConstraint.activate([
            timerDescriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -contentView.frame.height / 7),
            timerDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -contentView.frame.width / 9)
            ])
        NSLayoutConstraint.activate([
            challengeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            challengeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -contentView.frame.height / 4)
            ])
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
        timerLabel.text = "\(seconds)"
        isTimerRunning = false
        canceledDelegate?.cancelButtonWasTapped()
    }
    
    

    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
  }

    @objc func updateTimer() {
        secondsCopy -= 1
        timerLabel.text = "\(secondsCopy)"
    }
    
    

}
