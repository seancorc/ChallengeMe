

import UIKit



class ChallengeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    var challengeImageView: UIImageView!
    
    var challenges: [Challenge]?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getChallenges()

        
        self.navigationItem.title = "ChallengeYou!"
        
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = .white
        collectionView?.register(ChallengePageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let challenges = self.challenges {
            return challenges.count
        }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ChallengePageCell
        if let challengeArray = self.challenges {
            cell.challenge = challengeArray[indexPath.row]
            cell.configure()
            cell.tag = indexPath.row
        }
        cell.acceptedDelegate = self
        cell.canceledDelegate = self
        cell.completedDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func getChallenges() {
        NetworkManager.getChallenges { challengesArray in
            self.challenges = challengesArray
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
    }
    
}

extension ChallengeViewController: ButtonDelegate {
    
    func cancelButtonWasTapped() {
        collectionView?.isScrollEnabled = true
    }
    

    func acceptButtonWasTapped() {
        collectionView?.isScrollEnabled = false
    }
    
    func completedButtonWasTapped(tag: Int) {
        
        let challenge = self.challenges?[tag]
        let completedViewController = CompletedViewController()
        completedViewController.challenge = challenge
        
        
        let modalNavigationController = UINavigationController(rootViewController: completedViewController)
        let dismissButton = UIBarButtonItem(title: "Dismiss", style: .plain,
                                            target: self, action: #selector(dismissViewController))
        completedViewController.navigationItem.leftBarButtonItem = dismissButton
        navigationController?.present(modalNavigationController, animated: true)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
    

}
