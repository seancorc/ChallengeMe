

import UIKit



class ChallengeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    var challengeImageView: UIImageView!
    
    var challenges: [Challenge]?
    
    var indexPathInt: Int = 42
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getChallenges()

        
        
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
        }
        cell.acceptedDelegate = self
        cell.canceledDelegate = self
        cell.completedDelegate = self
        indexPathInt = indexPath.row
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
    
    func completedButtonWasTapped() {
        
        let challenge = self.challenges?[indexPathInt]
        let description = challenge?.text
        let time = challenge?.timeToFinish
        let completedViewController = CompletedViewController()
        completedViewController.challenge = description!
        completedViewController.time = time!
        
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
