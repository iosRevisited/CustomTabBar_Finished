//
//  HomeViewController.swift
//  CustomTabBar_Starter
//
//  Created by Sai Sandeep on 12/06/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var dataSource = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        dataSource = [Place(name: "Ocean view during daylight", hostName: "Carey", imageName: "Ocean", createdOn: "23th Mar 2019"), Place(name: "Coconut palm trees", hostName: "Stark", imageName: "Trees", createdOn: "13th Mar 2019"), Place(name: "Trees in park", hostName: "Micheal", imageName: "Park", createdOn: "28th Feb 2019"), Place(name: "Water under sunset", hostName: "Shiny", imageName: "Sunset", createdOn: "16th Feb 2019"), Place(name: "Green trees beside roadway", hostName: "Nina", imageName: "Forest", createdOn: "1st Feb 2019")]
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(switchChanged), name:  Notification.Name(rawValue: "switchChanged"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideBottomSwitch(false)
    }
    
    func setupViews() {
        self.navigationController?.navigationBar.isTranslucent = false
        view.addSubview(tableView)
        tableView.edges([.all], to: view.safeAreaLayoutGuide, offset: .zero)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CellIds.hostCellId)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CellIds.travellerCellId)
    }
    
    @objc func switchChanged() {
        self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.place = dataSource[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.hideBottomSwitch(true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isTraveller {
            // Traveller Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.travellerCellId, for: indexPath) as! CustomTableViewCell
            let itemAtIndex = dataSource[indexPath.row]
            cell.imgView.image = UIImage(named: itemAtIndex.imageName)
            cell.txtLabel.text = itemAtIndex.name
            cell.subtitleLabel.text = itemAtIndex.hostName
            cell.selectionStyle = .none
            return cell
        }else {
            // Host Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.hostCellId, for: indexPath) as! CustomTableViewCell
            let itemAtIndex = dataSource[indexPath.row]
            cell.imgView.image = UIImage(named: itemAtIndex.imageName)
            cell.txtLabel.text = itemAtIndex.name
            cell.subtitleLabel.text = itemAtIndex.createdOn
            cell.selectionStyle = .none
            return cell
        }
    }
    
}
