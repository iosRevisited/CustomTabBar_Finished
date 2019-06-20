//
//  TabBarSwitchView.swift
//  CustomTabBar_Finished
//
//  Created by Sai Sandeep on 19/06/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

class TabBarSwitchView: UIView {
    
    let onColor = UIColor(hex: 0xF9CF2D)
    
    let offColor = UIColor.white
    
    let deselectColor = UIColor(hex: 0xBFBFBF)
    
    let bgColor = UIColor(hex: 0x404040)
    
    var travellerLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var hostLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var switchButton: UISwitch = {
        let v = UISwitch()
        v.isUserInteractionEnabled = false
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var ison: Bool = false {
        didSet {
            isTraveller = !ison
            switchButton.setOn(ison, animated: true)
            if ison {
                hostLabel.textColor = onColor
                travellerLabel.textColor = deselectColor
            }else {
                hostLabel.textColor = deselectColor
                travellerLabel.textColor = offColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let scale:CGFloat = 0.6
    
    func setupViews() {
        self.backgroundColor = bgColor
        self.addSubview(switchButton)
        switchButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        switchButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        switchButton.onTintColor = onColor
        switchButton.tintColor = UIColor.white
        switchButton.thumbTintColor = bgColor
        switchButton.layoutIfNeeded()
        switchButton.backgroundColor = offColor
        switchButton.layer.cornerRadius = 16
        switchButton.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        self.addSubview(travellerLabel)
        travellerLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        travellerLabel.trailingAnchor.constraint(equalTo: switchButton.leadingAnchor, constant: -8).isActive = true
        travellerLabel.text = "TRAVELLER"
        travellerLabel.font = UIFont.systemFont(ofSize: 12)
        travellerLabel.textColor = UIColor.white
        
        self.addSubview(hostLabel)
        hostLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        hostLabel.leadingAnchor.constraint(equalTo: switchButton.trailingAnchor, constant: 8).isActive = true
        hostLabel.text = "HOST"
        hostLabel.font = UIFont.systemFont(ofSize: 12)
        hostLabel.textColor = onColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

