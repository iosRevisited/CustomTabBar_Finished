//
//  CustomTabBarVC.swift
//  CustomTabBar_Starter
//
//  Created by Sai Sandeep on 12/06/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

class CustomTabBarVC: UITabBarController {
    
    var hideSwitch: Bool = false {
        didSet {
            print("view")
            if let parentVc = self.parent as? TabBarRootVC {
                parentVc.hideBottomBar = hideSwitch
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Tab0"), tag: 0)
        
        let accountVC = UINavigationController(rootViewController: AccountViewController())
        accountVC.tabBarItem = UITabBarItem(title: "My Account", image: UIImage(named: "Tab1"), tag: 1)
        
        self.viewControllers = [homeVC, accountVC]
        
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor.purple
        
    }
    
}

