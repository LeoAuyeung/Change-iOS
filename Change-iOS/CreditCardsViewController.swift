//
//  CreditCardsViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/18/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit

class CreditCardsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var myCards = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Credit Cards"
        NotificationCenter.default.addObserver(self, selector: #selector(getMyCards), name: NSNotification.Name(rawValue: "loadcards"), object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        getMyCards()
    }
    
    @objc func getMyCards() {
        CCManager.shared.getAllCards()
        let cards = CCManager.shared.ccNumbers
        myCards = cards
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        let formVC = storyboard?.instantiateViewController(identifier: "FormViewController") as! FormViewController
        
        navigationController?.pushViewController(formVC, animated: true)
    }
}


//MARK - Table View Delegate
extension CreditCardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK - Table View Data Source
extension CreditCardsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CCardCell") as! CustomCell
        
        cell.cellLabel.text = String(myCards[indexPath.row])
        
        return cell
    }
}
