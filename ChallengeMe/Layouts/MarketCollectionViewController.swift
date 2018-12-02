//
//  MarketCollectionViewController.swift
//  ChallengeMe
//
//  Created by John Smith on 11/21/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class MarketCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let filterCollectionViewHeight: CGFloat = 50
    let padding: CGFloat = 20
//    let filterReuseIdentifier: String = "FilterCollectionViewCell"
    let challengeReuseIdentifier: String = "ChallengeCollectionViewCell"
    var collectionView: UICollectionView!
    
    var Challenges: [Challenge] = []
    var activeChallenges: [Challenge] = []
    
//    var filters: [Filter] = []
//    var activeCostFilter: Set<Cost> = []
//    var activeMealTimeFilter: Set<MealTime> = []
//    var activeCuisineTypeFilter: Set<CuisineType> = []
    
//    var filterCollectionView: UICollectionView!
    var displayChallengesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationItem.title = "My Challenges"
        edgesForExtendedLayout = [] // gets rid of views going under navigation controller
        
        //Challenges = ChallengeAPI.getChallenges()
        activeChallenges = Challenges
        //filters = RestAPI.getFilters()
        
        let layout = UICollectionViewFlowLayout()
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        
//        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        filterCollectionView.delegate = self
//        filterCollectionView.dataSource = self
//        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
//        filterCollectionView.showsHorizontalScrollIndicator = false
//        filterCollectionView.backgroundColor = .clear
//        filterCollectionView.allowsMultipleSelection = true //this is how we select multiple cells at once
//        view.addSubview(filterCollectionView)
        
        displayChallengesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        displayChallengesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        displayChallengesCollectionView.dataSource = self
        displayChallengesCollectionView.delegate = self
        displayChallengesCollectionView.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: challengeReuseIdentifier)
        displayChallengesCollectionView.showsHorizontalScrollIndicator = false
        displayChallengesCollectionView.backgroundColor = .clear
        view.addSubview(displayChallengesCollectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
//        filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        filterCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        filterCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        filterCollectionView.heightAnchor.constraint(equalToConstant: filterCollectionViewHeight).isActive = true
        
        displayChallengesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        displayChallengesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayChallengesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        displayChallengesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        displayChallengesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    //MARK:
    //MARK: CollectionView Delegates / Datasources
    //MARK:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == filterCollectionView {
//            return filters.count
//        } else {
            return activeChallenges.count
//        }
    }
    
    //add filter
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == filterCollectionView {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return }
//            let currentFilter = filters[indexPath.item]
//            changeFilter(filter: currentFilter, shouldRemove: false)
//            displayChallengesCollectionView.reloadData()
//        }
    }
    
    //remove filter
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if collectionView == filterCollectionView {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return }
//            let currentFilter = filters[indexPath.item]
//            changeFilter(filter: currentFilter, shouldRemove: true)
//            displayChallengesCollectionView.reloadData()
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == filterCollectionView {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell() }
//            let filter = filters[indexPath.item]
//            cell.setup(with: filter.filterTitle)
//            return cell
//        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: challengeReuseIdentifier, for: indexPath) as? ChallengeCollectionViewCell else { return UICollectionViewCell() }
            let challenge = activeChallenges[indexPath.item]
            cell.setup(withChallenge: challenge)
            return cell
//        }
    }


}
