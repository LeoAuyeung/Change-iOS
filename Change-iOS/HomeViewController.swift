//
//  HomeViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {    
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = UserDefaults.standard
    let dataSource = ["A", "B", "C"]
    
    var myCharities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

//MARK - Table View Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let donateVC = storyboard?.instantiateViewController(identifier: "DonateViewController") as! DonateViewController
        
        donateVC.detailText = dataSource[indexPath.row]
        
        navigationController?.pushViewController(donateVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK - Table View Data Source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCharityCell") as! HomeCharityCell
        
        cell.cellLabel.text = dataSource[indexPath.row]
        
        return cell
    }
}
