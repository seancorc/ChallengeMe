

import UIKit



class ChallengeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    var challengeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = .white
        collectionView?.register(ChallengePageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
        
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            challengeImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            challengeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: contentView.frame.height / 4)
            ])
    }
    
    func getChallenges() {
        JasonsNetworkManager.getChallenges { challengesArray in self.challenges = challengesArray
            DispatchQueue.main.async {
                self.reloadData()
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
        collectionView.isScrollEnabled = true
    }
    

    func acceptButtonWasTapped() {
        collectionView.isScrollEnabled = false
    }

}
