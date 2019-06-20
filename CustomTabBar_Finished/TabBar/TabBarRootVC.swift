//
//  TabBarRootVC.swift
//  CustomTabBar_Finished
//
//  Created by Sai Sandeep on 19/06/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

var isTraveller = false
class TabBarRootVC: UIViewController {

    private lazy var tabBarVC: CustomTabBarVC = {
        var viewController = CustomTabBarVC()
        return viewController
    }()
    
    var bottomHeight: CGFloat {
        guard #available(iOS 11.0, *),
            let window = UIApplication.shared.keyWindow else {
                return 0
        }
        return window.safeAreaInsets.bottom
    }
    
    var switchView: TabBarSwitchView = {
        let v = TabBarSwitchView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var hideBottomBar: Bool = false {
        didSet {
            if hideBottomBar {
                heightConstraint.constant = 0
            }else {
                heightConstraint.constant = 32 + bottomHeight
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(switchView)
        switchView.edges([.left, .right, .bottom], to: self.view, offset: .zero)
        heightConstraint = switchView.heightAnchor.constraint(equalToConstant: 32 + bottomHeight)
        heightConstraint.isActive = true
        switchView.ison = false
        switchView.isUserInteractionEnabled = true
        switchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(switchViewTapped(recognizer:))))
        
        addChild(tabBarVC)
        self.view.addSubview(tabBarVC.view)
        tabBarVC.view.translatesAutoresizingMaskIntoConstraints = false
        tabBarVC.view.edges([.left, .right, .top], to: self.view, offset: .zero)
        tabBarVC.view.bottomAnchor.constraint(equalTo: switchView.topAnchor, constant: 0).isActive = true
        tabBarVC.didMove(toParent: self)
        if !hideBottomBar {
            heightConstraint.constant = 32 + bottomHeight
        }else {
            heightConstraint.constant = 0
        }
        
    }
    
    @objc func switchViewTapped(recognizer: UITapGestureRecognizer) {
        switchView.ison = !switchView.ison
        isTraveller = !switchView.ison
        NotificationCenter.default.post(name: Notification.Name(rawValue: "switchChanged"), object: nil)
    }
    

}
