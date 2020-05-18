//
//  DetailViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var detailText : String?
    
    // use UserDefaults to save myCharities so that user keeps them upon restart app
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = detailText
    }
}
