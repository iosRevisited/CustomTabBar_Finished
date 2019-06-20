//
//  CustomTableViewCell.swift
//  CustomTabBar_Starter
//
//  Created by Sai Sandeep on 12/06/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

class CellIds {
    
    static let travellerCellId = "travellerCellId"
    
    static let hostCellId = "hostCellId"
}

class CustomTableViewCell: UITableViewCell {
    
    var txtLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var subtitleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var imgView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if let id = reuseIdentifier {
            if id == CellIds.travellerCellId {
                setupTravellerViews()
            }else {
                setupHostViews()
            }
        }
    }
    
    let LRPadding: CGFloat = 20
    
    let TBPadding: CGFloat = 8
    
    func setupTravellerViews() {
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(txtLabel)
        self.contentView.addSubview(subtitleLabel)
        
        txtLabel.edges([.left, .right, .top], to: self.contentView, offset: UIEdgeInsets(top: LRPadding, left: LRPadding, bottom: 0, right: -LRPadding))
        txtLabel.font = UIFont.boldSystemFont(ofSize: 16)
        txtLabel.textColor = UIColor.darkText
        txtLabel.text = "Title"
        
        subtitleLabel.edges([.left, .right], to: self.txtLabel, offset: .zero)
        subtitleLabel.topAnchor.constraint(equalTo: txtLabel.bottomAnchor, constant: TBPadding).isActive = true
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = UIColor.lightGray
        subtitleLabel.text = "SubtitleLabel"
        
        imgView.edges([.left, .right, .bottom], to: contentView, offset: UIEdgeInsets(top: 0, left: 0, bottom: -LRPadding, right: 0))
        imgView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: TBPadding).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "Beach")
    }
    
    func setupHostViews() {
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(txtLabel)
        self.contentView.addSubview(subtitleLabel)
        
        imgView.edges([.left, .top, .bottom], to: contentView, offset: UIEdgeInsets(top: LRPadding, left: LRPadding, bottom: -LRPadding, right: 0))
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor, multiplier: 1).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "Beach")
        
        txtLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: LRPadding).isActive = true
        txtLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -4).isActive = true
        txtLabel.font = UIFont.boldSystemFont(ofSize: 16)
        txtLabel.textColor = UIColor.darkText
        txtLabel.text = "Title"
        
        subtitleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: LRPadding).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 4).isActive = true
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = UIColor.lightGray
        subtitleLabel.text = "SubtitleLabel"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
