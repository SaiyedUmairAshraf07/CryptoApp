//
//  Splash Screen Controller.swift
//  Dashboard
//
//  Created by cedcoss on 5/4/25.
//

import Foundation
import UIKit

class SplashScreenController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        showLogo()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.goToMainScreen()
        }
    }
    
    private func showLogo() {
        let imageView = UIImageView(image: UIImage(named: "appstore"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20,width: 200, height: 300)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func goToMainScreen() {
        let tabBarVC = MainTabbarController()
        let nav = UINavigationController(rootViewController: tabBarVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

