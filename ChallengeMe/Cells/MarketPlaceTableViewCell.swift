//
//  MarketPlaceTableViewCell.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class MarketPlaceTableViewCell: UITableViewCell {
    var challenge: Challenge!
    var nameLabel: UILabel!
    var timeAllotedLabel: UILabel!
    var challengeImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //challenge = Challenge(description: "Start a conversation with a stranger", time: 5)
        
        challengeImage = UIImageView(image: UIImage(named: "Default Profile Picture"))
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeImage)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        //nameLabel.text = "\(challenge.description)"
        nameLabel.text = "Start a conversation with a stranger"
        nameLabel.textColor = .black
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(nameLabel)
        
        timeAllotedLabel = UILabel()
        timeAllotedLabel.translatesAutoresizingMaskIntoConstraints = false
        //timeAllotedLabel.text = "Time Alloted: \(challenge.time)"
        timeAllotedLabel.text = "Time Allotted: 5"
        timeAllotedLabel.textColor = .black
        timeAllotedLabel.sizeToFit()
        timeAllotedLabel.textAlignment = .left
        timeAllotedLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(timeAllotedLabel)
        
        // Initialization code
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            challengeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            challengeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            challengeImage.widthAnchor.constraint(equalToConstant: 75),
            challengeImage.heightAnchor.constraint(equalToConstant: 75)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: challengeImage.trailingAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            timeAllotedLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 24),
            timeAllotedLabel.leadingAnchor.constraint(equalTo: challengeImage.trailingAnchor, constant: 8)
            ])
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
