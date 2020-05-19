//
//  CCManager.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/18/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation

// Singleton class implementation
class CCManager {
    static let shared = CCManager()
    
    private init(){}
    let defaults = UserDefaults.standard
    var ccNumbers = [String]()
    var secCodes = [String]()
    var expDates = [String]()
    var names = [String]()
    
    func getAllCards() {
        let myCards = defaults.object(forKey: "myCards") as? [String] ?? [String]()
        ccNumbers = myCards
    }
    
    func addNewCard(ccNum: String, secCode: String, expDate: String, name: String) {
        ccNumbers.append(ccNum)
        var myCards = defaults.object(forKey: "myCards") as? [String] ?? [String]()
        myCards.append(ccNum)
        defaults.set(myCards, forKey: "myCards")
        
        secCodes.append(secCode)
        expDates.append(expDate)
        names.append(name)
    }
    
    
}
