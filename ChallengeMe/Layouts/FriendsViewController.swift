//
//  MarketTableViewController.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var users: [User]! = []
    var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        
        self.navigationItem.title = "Users"
        
        
        background = UIImageView(image: UIImage(named: "Orange Rectangle"))
        background.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(background)
        
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.backgroundColor = .clear
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! FriendTableViewCell
        cell.backgroundColor = .clear
        cell.user = self.users[indexPath.row]
        cell.awakeFromNib()
        cell.updateConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func getUsers() {
        NetworkManager.getUsers { (users) in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
}

