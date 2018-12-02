//
//  MarketTableViewController.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class MarketTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    var challenges: [Challenge]!
    var gifs: [String]!

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getChallengesInfo()
        
        self.challenges = []
        self.gifs = []
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MarketPlaceTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.backgroundColor = .white
        self.view.addSubview(tableView)
        
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func getChallenges() {
        NetworkManager.getChallenges { challengesArray in self.challenges = challengesArray
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.challenges.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("in here")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! MarketPlaceTableViewCell
        cell.challenge = self.challenges[indexPath.row]
        cell.gifURL = self.gifs[indexPath.row]
        cell.awakeFromNib()
        //Awake from Nib needs to be called first
        cell.updateConstraints()
        return cell
    }
    
    func getChallengesInfo() {
        NetworkManager.getChallenges { (array) in
            self.challenges = array
            self.tableView.reloadData()
        
        for challenge in self.challenges {
            self.gifs.append(challenge.imgURL)
        }
        
            
        
    }
    
    
    }
    
}
