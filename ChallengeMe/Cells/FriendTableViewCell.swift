//
//  MarketPlaceTableViewCell.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    //var person: Person!
    var nameLabel: UILabel!
    var profilePicture: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //person = Person(firstName: "First", lastName: "Last", profilePicture: UIImage(named: "Default Profile Picture"), challengesCompleted: 7, streak: 12)
        
        profilePicture = UIImageView(image: UIImage(named: "Default Profile Picture"))
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profilePicture)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        //nameLabel.text = "\(person.firstName) \(person.lastName)"
        nameLabel.textColor = .black
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        contentView.addSubview(nameLabel)
   
        // Initialization code
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            profilePicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            profilePicture.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profilePicture.widthAnchor.constraint(equalToConstant: 75),
            profilePicture.heightAnchor.constraint(equalToConstant: 75)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 8)
            ])
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

