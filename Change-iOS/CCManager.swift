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
    var ccNumbers = [Int]()
    var secCodes = [Int]()
    var expDates = [Int]()
    var names = [String]()
    
    func getAllCards() {
        let myCards = defaults.object(forKey: "myCards") as? [Int] ?? [Int]()
        ccNumbers = myCards
    }
    
    func addNewCard(ccNum: Int, secCode: Int, expDate: Int, name: String) {
        ccNumbers.append(ccNum)
        var myCards = defaults.object(forKey: "myCards") as? [Int] ?? [Int]()
        myCards.append(ccNum)
        defaults.set(myCards, forKey: "myCards")
        
        secCodes.append(secCode)
        expDates.append(expDate)
        names.append(name)
    }
    
    
}
