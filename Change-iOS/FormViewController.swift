//
//  FormViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/18/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation
import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var creditCardField: UITextField!
    @IBOutlet weak var securityCodeField: UITextField!
    @IBOutlet weak var expirationDateField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creditCardField.delegate = self
        securityCodeField.delegate = self
        expirationDateField.delegate = self
        nameField.delegate = self
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        CCManager.shared.addNewCard(ccNum: Int(creditCardField.text!)!, secCode: Int(securityCodeField.text!)!, expDate: Int(expirationDateField.text!)!, name: nameField.text!)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadcards"), object: nil)
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        creditCardField.resignFirstResponder()
        securityCodeField.resignFirstResponder()
        expirationDateField.resignFirstResponder()
    }
}

extension FormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
