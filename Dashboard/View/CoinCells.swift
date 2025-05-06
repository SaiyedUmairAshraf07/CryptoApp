//
//  CoinCells.swift
//  Dashboard
//
//  Created by cedcoss on 4/20/25.
//

import Foundation
import UIKit

class CoinCell : UICollectionViewCell {
    
    static let identifier = "CoinCell"
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.makeBorder(width: 0.5, color: .lightGray, radius: 15)
//        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var namelabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var idLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var markerCapLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalVolumeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [namelabel, idLabel, currentPriceLabel, markerCapLabel, totalVolumeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        
//        namelabel.text = " namelabel"//data.name
//        idLabel.text = " didLabel"//"#\(data.id)"
//        currentPriceLabel.text = " dcurrentPriceLabels"//"\(data.current_price)"
//        markerCapLabel.text = " markerCapLabel"//"Market Cap: \(data.market_cap)"
//        totalVolumeLabel.text = " totalVolumeLabel"//"Total Volume: \(data.total_volume)"
//        imageView.image = UIImage(named: "car")
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: Coin) {
        
//        self.coinData  = data
        print("CoinData: \(data)")
        
        namelabel.text = data.name
        idLabel.text = "# \(data.id)"
        currentPriceLabel.text = "\(data.current_price)"
        markerCapLabel.text = "Market Cap:  \(data.market_cap)"
        totalVolumeLabel.text = "Total Volume:  \(data.total_volume)"
        loadImage(urlString: data.image)
        
    }
    
    func setUpView() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(labelStackView)

        
        containerView.anchor(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, paddingTop: 2, paddingLeft: -2, paddingBottom: -2, paddingRight: 2)
        
//        containerView.makeBorder(width: 1.0, color: .red, radius: 0.0)
        
        imageView.anchor(top: containerView.topAnchor, left: containerView.leadingAnchor, right: containerView.trailingAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, height: 150)
        
        labelStackView.anchor(top: imageView.bottomAnchor, left: imageView.leadingAnchor, bottom: containerView.bottomAnchor, right: imageView.trailingAnchor, paddingTop: 10 , paddingLeft: 5, paddingBottom: 10, paddingRight: 5)

    }
    
    private func loadImage(urlString: String) {
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                
            }.resume()
        }
    }
}
