//
//  MainTabBarController.swift
//  ChallengeMe
//
//  Created by Sean Corcoran on 11/29/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.white
        setupTabBar()
        
        if let items = tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
            }
        }
        

    }
    
    
    func setupTabBar() {
        let viewController = UINavigationController(rootViewController: ViewController())
        viewController.tabBarItem.image = UIImage(named: "home")
        //viewController.title = "Home"
        
        let marketController = UINavigationController(rootViewController: MarketCollectionViewController())
        marketController.tabBarItem.image = UIImage(named: "marketplace")
        //marketController.title = "Marketplace"

        let friendsController = UINavigationController(rootViewController: FriendsViewController())
        friendsController.tabBarItem.image = UIImage(named: "friends")
        //friendsController.title = "Friends"
        
        let personController = UINavigationController(rootViewController: PersonViewController())
        personController.tabBarItem.image = UIImage(named: "My Profile")
        //personController.title = "Me"
        
       
        
        let viewControllersArray = [viewController, marketController, friendsController, personController]
        self.viewControllers = viewControllersArray
    }

 
}
