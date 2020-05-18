//
//  SearchViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SearchViewController: UIViewController {
    
    var charities = [String]()
    
    // use UserDefaults to save myCharities so that user keeps them upon restart app
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search Charities"
        
        tableView.delegate = self
        tableView.dataSource = self
        getCharities()
    }
    
    struct charity: Codable {
        var orgID: Int
        var charityName: String
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            orgID = try container.decode(Int.self, forKey: .orgID)
            charityName = try container.decode(String.self, forKey: .charityName)
        }
    }
    
    // pull data from charitynavigator api
    func getCharities() {
//        let apiUrl = URL(string: "https://jsonplaceholder.typicode.com/todos")! // test api
        let apiUrl = URL(string: "https://api.data.charitynavigator.org/v2/Organizations?app_id=d8f673ca&app_key=799808ea56b0fdb9e77077ed90329ac0&categoryID=4&state=NY")!
        URLSession.shared.dataTask(with: apiUrl) { webData, urlResponse, apiError in
           if let data = webData {
              do {
                let responseJson = try JSONDecoder().decode([charity].self, from: data)
                for i in 0...10 {
                    self.charities.append(responseJson[i].charityName)
                }
                // reload
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
              }
              catch let error {
                 print(error)
              }
           }
        }.resume()
    }
}

//MARK - Table View Cell Delegate
extension SearchViewController: MyCharitiesDelegate {
    func didTapButton(target: String) {
        var myCharities = defaults.object(forKey: "myCharities") as? [String] ?? [String]()
//        functionality to add or remove charity from list
        if target != "" && myCharities.contains(target) {
            // remove charity
            myCharities = myCharities.filter{$0 != "\(target)"}
            defaults.set(myCharities, forKey: "myCharities")
            AudioServicesPlayAlertSound(SystemSoundID(1003))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
        else {
            // add charity
            myCharities.append(target)
            defaults.set(myCharities, forKey: "myCharities")
            AudioServicesPlayAlertSound(SystemSoundID(1004))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
}

//MARK - Table View Delegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        detailVC.detailText = charities[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK - Table View Data Source
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let charityName = charities[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        cell.cellLabel.text = charities[indexPath.row]
        cell.setButtonTitle(target: charityName)
        cell.delegate = self
        
        return cell
    }
}
