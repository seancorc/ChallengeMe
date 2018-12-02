

import UIKit



class ChallengeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    var challengeImageView: UIImageView!
    
    var challenges = [Challenge]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = .white
        collectionView?.register(ChallengePageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
        
        getChallenges()
    }
    
    func getChallenges() {
        ChallengeNetworkManager.getChallenges { challengesArray in self.challenges = challengesArray
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ChallengePageCell
        cell.configure(for: challenges[indexPath.row])
        cell.acceptedDelegate = self
        cell.canceledDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

extension ChallengeViewController: ButtonDelegate {
    func cancelButtonWasTapped() {
        collectionView?.isScrollEnabled = true
    }
    

    func acceptButtonWasTapped() {
        collectionView?.isScrollEnabled = false
    }

}
