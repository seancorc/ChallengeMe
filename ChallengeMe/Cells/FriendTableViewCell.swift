//
//  MarketPlaceTableViewCell.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var profilePicture: UIImageView!
    var challengesCompletedLabel: UILabel!
    var user: User!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        profilePicture = UIImageView()
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.cornerRadius = 20
        contentView.addSubview(profilePicture)
        
        getProfilePic()
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "\(user.username)"
        nameLabel.textColor = .black
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(nameLabel)
        
        challengesCompletedLabel = UILabel()
        challengesCompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        challengesCompletedLabel.text = "Challenges Completed: \(user.count_completed_challenges)"
        challengesCompletedLabel.textColor = .black
        challengesCompletedLabel.sizeToFit()
        challengesCompletedLabel.textAlignment = .left
        challengesCompletedLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(challengesCompletedLabel)
        
    
   
        // Initialization code
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            profilePicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            profilePicture.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profilePicture.widthAnchor.constraint(equalToConstant: 75),
            profilePicture.heightAnchor.constraint(equalToConstant: 75)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            challengesCompletedLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 24),
            challengesCompletedLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 8)
            ])
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func getProfilePic() {
        NetworkManager.getProfilePicture(url: user.pic) { (pic) in
            self.profilePicture.image = pic
        }
    }
    
    
}

