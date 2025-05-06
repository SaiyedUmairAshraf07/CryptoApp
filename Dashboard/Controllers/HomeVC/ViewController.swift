//
//  ViewController.swift
//  Dashboard
//
//  Created by cedcoss on 4/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let coinViewModel = CoinListViewModel()
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Crypto Dashboard"
        self.navigationController?.navigationBar.makeBorder(width: 1.0, color: .red, radius: 0.0)
        self.navigationController?.navigationBar.layoutIfNeeded()

//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
        
        
        self.view.backgroundColor = .systemBackground
        
        setUpCollectionView()
        
        coinViewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        coinViewModel.fetchCoins()
//        setUpBinding()
        print("DATA FETCHED")
    }
        
//    private func setUpBinding(){
//        
//        coinViewModel.fetchCoins {
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//        
//    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: view.frame.width / 2, height: 100)
//        layout.minimumLineSpacing = 16
//        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: -8, right: 4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(CoinCell.self, forCellWithReuseIdentifier: CoinCell.identifier)
        collectionView.register(LodingSpinnerCell.self, forCellWithReuseIdentifier: LodingSpinnerCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.makeBorder(width: 1.0, color: .green, radius: 0.0)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor,paddingLeft: 8, paddingRight: 9)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.height
        
        if offsetY > contentHeight - frameHeight - 100 {
            coinViewModel.fetchCoins()
            print("Reached bottom")
        }
    }


}


extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinViewModel.coins.count + (coinViewModel.isFecthingData ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item >= coinViewModel.coins.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LodingSpinnerCell.identifier, for: indexPath) as! LodingSpinnerCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoinCell.identifier, for: indexPath) as! CoinCell
        cell.configure(with: coinViewModel.coins[indexPath.item])
        cell.cardVieW()
        return cell
    }

}

extension ViewController : UICollectionViewDelegate {
 
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item >= coinViewModel.coins.count {
            return CGSize(width: collectionView.frame.width, height: 50)
        }
        
        let noOfCellsInRow: CGFloat = 2
        let spacing: CGFloat = 20
        let widthPerItem = (collectionView.frame.width - (noOfCellsInRow - 1) * spacing) / noOfCellsInRow
        let heightPerItem: CGFloat = collectionView.frame.height / 3
        
        return CGSize(width: widthPerItem , height: heightPerItem+30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

