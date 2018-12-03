//
//  MarketPlaceTableViewCell.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit
import Alamofire

class MarketPlaceTableViewCell: UITableViewCell {
    var gifURL: String!
    var challenge: Challenge!
    var nameLabel: UILabel!
    var timeAllotedLabel: UILabel!
    var challengeImage: UIImageView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        challengeImage = UIImageView()
        challengeImage.image = UIImage(named: "Default Profile Picture")
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(challengeImage)
        
        
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(nameLabel)
        
        timeAllotedLabel = UILabel()
        timeAllotedLabel.translatesAutoresizingMaskIntoConstraints = false
        timeAllotedLabel.textColor = .black
        timeAllotedLabel.sizeToFit()
        timeAllotedLabel.textAlignment = .left
        timeAllotedLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(timeAllotedLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func configure() {
        nameLabel.text = "\(challenge.text)"
        if challenge.timeToFinish == "five_minutes" {
            timeAllotedLabel.text = "Time Alloted: Five Minutes"
        }
        if challenge.timeToFinish == "six_hours" {
            timeAllotedLabel.text = "Time Alloted: Six Hours"

        }
        if challenge.timeToFinish == "one_day" {
            timeAllotedLabel.text = "Time Alloted: One Day"
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    

}
