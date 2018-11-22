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
    
    var timerLabel: UILabel = UILabel()
    var startButton: UIButton = UIButton()
    var timer = Timer()
    var seconds = 60
    var isTimerRunning = false
    var tapped = false
    var acceptButton: UIButton = UIButton()
    var cancelButton: UIButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancelButton.isEnabled = false
        
        navigationItem.title = "Get Challenged M8"
        view.backgroundColor = .white
        
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.setTitleColor(.red, for: .normal)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        // acceptButton.addTarget(self, action: #selector(pushRedArenaViewController), for: .touchUpInside)
        view.addSubview(acceptButton)

        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        // cancelButton.addTarget(self, action: #selector(pushRedArenaViewController), for: .touchUpInside)
        view.addSubview(cancelButton)

        
    }
    
    // STUFF FOR THE TIMER
    // TODO: Change seconds to the time from the individual challenge
    
    func acceptButtonTapped(_sender: UIButton) {
        
        if ( tapped == true && isTimerRunning == false ) {
            self.acceptButton.setTitle("Completed", for: .normal)
            runTimer()
            cancelButton.isEnabled = true
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
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
    
    func cancelButtonTapped(_sender: UIButton) {
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


}

