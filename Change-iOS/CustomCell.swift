//
//  CustomCell.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit

// Delegate Protocol
protocol MyCharitiesDelegate {
    func didTapButton(target: String)
}

// Subclassing UITableViewCell with various features
class CustomCell: UITableViewCell {
    let defaults = UserDefaults.standard
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    var delegate: MyCharitiesDelegate?
    var buttonText = "Add"
    
    func setButtonTitle(target: String!) {
        let myCharities = defaults.object(forKey: "myCharities") as? [String] ?? [String]()
        if myCharities.contains(target) {
            buttonText = "Remove"
        }
        else {
            buttonText  = "Add"
        }
        cellButton.setTitle(buttonText, for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.didTapButton(target: cellLabel.text ?? "")
    }
}
