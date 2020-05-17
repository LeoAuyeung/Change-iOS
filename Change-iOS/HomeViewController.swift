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
    
    let dataSource = ["A", "B", "C"]
    override func viewDidLoad() {
        super.viewDidLoad()
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

