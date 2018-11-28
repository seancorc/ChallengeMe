//
//  ChallengeViewController.swift
//  ChallengeMe
//
//  Created by John Smith on 11/25/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

// This is the "Start Challenge" screen

class ChallengePageCell: UICollectionViewCell {
    
    var timerLabel: UILabel!
    var timer = Timer()
    var seconds = 60
    var isTimerRunning = false
    var tapped = false
    var acceptButton: UIButton!
    var cancelButton: UIButton!
    
    var sender: UIButton? = nil
    
    let spacing: CGFloat = 40
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        acceptButton = UIButton()
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.setTitleColor(.red, for: .normal)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        addSubview(acceptButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.isHidden = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        addSubview(cancelButton)
        
        timerLabel = UILabel()
        timerLabel.text = "\(timeString)"
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timerLabel)
        
        


        setupConstraints()
        
    }
    
    func setupConstraints() {

        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -contentView.frame.height / 6)
            ])
        NSLayoutConstraint.activate([
            acceptButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            acceptButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: spacing)
            ])
        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cancelButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: spacing)
            
            ])


    }
    
    
    // STUFF FOR THE TIMER
    // TODO: Change seconds to the time from the individual challenge
    
    @objc func acceptButtonTapped(_sender: UIButton) {
        cancelButton.isHidden = false
        runTimer()
        
        if ( tapped == true && isTimerRunning == false ) {
            self.acceptButton.setTitle("Completed", for: .normal)
        }
        else {
            self.acceptButton.setTitle("Accept", for: .normal)
            cancelButton.isEnabled = false
            timer.invalidate()
            seconds = 60
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
            // Present the new screen
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ChallengePageCell.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            // send alert that timer is up
        }
        else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    //    func pauseButtonTapped(_ sender: UIButton) {
    //        if self.resumeTapped == false {
    //            timer.invalidate()
    //            self.resumeTapped = true
    //        }
    //        else {
    //            runTimer()
    //            self.resumeTapped = false
    //        }
    //    }
    
    @objc func cancelButtonTapped(_sender: UIButton) {
        timer.invalidate()
        seconds = 60
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        self.acceptButton.setTitle("Accept", for: .normal)
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time)/3600
        let minutes = ((Int(time) / 60)  % 60)
        let seconds = Int(time) % 60
        return String(format:"% 02i: %02i: %02i", hours, minutes, seconds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
