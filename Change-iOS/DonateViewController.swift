//
//  DonateViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit

class DonateViewController: UIViewController {
    @IBOutlet weak var detailLabel: UILabel!
    var detailText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = detailText
    }
}
