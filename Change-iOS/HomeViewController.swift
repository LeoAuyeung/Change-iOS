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
    var myCharities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Charities"
        // have tableView call getMyCharities again when adding or removing a charity from my list
        NotificationCenter.default.addObserver(self, selector: #selector(getMyCharities), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        getMyCharities()
    }
    
    @objc func getMyCharities() {
        let charities = defaults.object(forKey: "myCharities") as? [String] ?? [String]()
        myCharities = charities
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}


//MARK - Table View Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK - Table View Data Source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCharities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! CustomCell
        
        cell.cellLabel.text = myCharities[indexPath.row]
        
        return cell
    }
}
