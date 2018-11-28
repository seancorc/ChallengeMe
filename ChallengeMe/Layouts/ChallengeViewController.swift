//
//  SwipingPageController.swift
//  ChallengeMe
//
//  Created by John Smith on 11/27/18.
//  Copyright © 2018 ChallengeMe. All rights reserved.
//

//import UIKit
//
//
//class ChallengeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
////        let challengeViewController = ChallengeViewController(collectionViewLayout: layout)
////        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = .white
//        collectionView.register(ChallengePageCell.self, forCellWithReuseIdentifier: "cellId")
//        collectionView.isPagingEnabled = true
//        self.view.addSubview(collectionView)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//
//        // definitely don't try this, it is a very bad idea
//        //        let imageView = UIImageView()
//        //        cell.addSubview(imageView)
//
//        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//}

import UIKit

class ChallengeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ChallengePageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        // definitely don't try this, it is a very bad idea
        //        let imageView = UIImageView()
        //        cell.addSubview(imageView)
        
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
