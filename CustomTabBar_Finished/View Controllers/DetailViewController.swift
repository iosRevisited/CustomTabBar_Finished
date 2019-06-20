//
//  DetailViewController.swift
//  CustomTabBar_Starter
//
//  Created by Sai Sandeep on 12/06/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var txtLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var imgView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let LRPadding: CGFloat = 20
        self.view.addSubview(imgView)
        self.view.addSubview(txtLabel)
        
        
        imgView.edges([.left, .right, .top], to: view, offset: .zero)
        imgView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: place.imageName)
        
        txtLabel.edges([.left, .right], to: self.view, offset: UIEdgeInsets(top: LRPadding, left: LRPadding, bottom: 0, right: -LRPadding))
        txtLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: LRPadding).isActive = true
        txtLabel.font = UIFont.boldSystemFont(ofSize: 16)
        txtLabel.textColor = UIColor.darkText
        txtLabel.text = place.name
    }
    
}
