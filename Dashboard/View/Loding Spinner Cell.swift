//
//  Loding Spinner Cell.swift
//  Dashboard
//
//  Created by cedcoss on 4/21/25.
//

import UIKit
class LodingSpinnerCell: UICollectionViewCell {
    
    static let identifier = "LodingSpinnerCell"
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    private let uiView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .red
        uiView.anchor(width: 40, height: 40)
        return uiView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.addSubview(spinner)
//        contentView.addSubview(uiView)
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 40),
            spinner.heightAnchor.constraint(equalToConstant: 40),
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
