//
//  MarketPlaceTableViewCell.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit
import Alamofire
import FLAnimatedImage

class MarketPlaceTableViewCell: UITableViewCell {
    var gifURL: String!
    var challenge: Challenge!
    var nameLabel: UILabel!
    var timeAllotedLabel: UILabel!
    var challengeGif: FLAnimatedImageView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        
        
        
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
            self.challengeGif.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.challengeGif.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.challengeGif.widthAnchor.constraint(equalToConstant: 75),
            self.challengeGif.heightAnchor.constraint(equalToConstant: 75)
            ])
    
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: challengeGif.trailingAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            timeAllotedLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 24),
            timeAllotedLabel.leadingAnchor.constraint(equalTo: challengeGif.trailingAnchor, constant: 8)
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
        
        self.challengeGif = FLAnimatedImageView()
        self.challengeGif.translatesAutoresizingMaskIntoConstraints = false
        self.challengeGif.layer.cornerRadius = 10
        self.contentView.addSubview(self.challengeGif)
        NetworkManager.getChallengeGif(url: self.challenge.imgURL) { (data) in
            let gif = FLAnimatedImage.init(animatedGIFData: data)
            self.challengeGif.animatedImage = gif
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    

}
