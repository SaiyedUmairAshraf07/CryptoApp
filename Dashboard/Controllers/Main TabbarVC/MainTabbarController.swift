//
//  MainTabbarController.swift
//  Dashboard
//
//  Created by cedcoss on 5/4/25.
//

import Foundation
import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUpTabs()
    }
    
    private func setUpTabs() {
        let homeVC = ViewController()
//        homeVC.tab?.title = "Home"
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let wishListVC = WishListViewController()
        wishListVC.title = "WishList"
        let wishListNav = UINavigationController(rootViewController: wishListVC)
        wishListNav.tabBarItem = UITabBarItem(title: "WishList", image: UIImage(systemName: "cart"), tag: 1)
        
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        
        viewControllers = [homeNav, wishListNav, profileNav]
    }
}
