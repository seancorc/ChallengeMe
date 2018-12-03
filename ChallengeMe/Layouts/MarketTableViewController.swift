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
    
    var background: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getChallengesInfo()
        
        
        self.navigationItem.title = "All Challenges"
        
        background = UIImageView(image: UIImage(named: "Orange Rectangle"))
        background.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(background)
        
        
        self.challenges = []
        self.gifs = []
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(MarketPlaceTableViewCell.self, forCellReuseIdentifier: "cellID")
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
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! MarketPlaceTableViewCell
        cell.challenge = self.challenges[indexPath.row]
        cell.backgroundColor = .clear
        cell.configure()
        cell.updateConstraints()
        cell.gifURL = self.gifs[indexPath.row]
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
