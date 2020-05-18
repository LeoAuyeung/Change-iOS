//
//  CharityAPIService.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

// NOT CURRENTLY USING THSI CLASS!

import Foundation

class CharityAPIService {
    func executeWebRequest(urlToExecute: URL, completionHandler: @escaping ([String:Any]?, Error?) -> Void) {
        
        let sharedSession = URLSession.shared
        
        let webRequest = URLRequest(url: urlToExecute)
        
        let dataTask = sharedSession.dataTask(with: webRequest) { (webData, urlResponse, apiError) in
            
            // Used to check incase charity nav api returns error
            guard let unwrappedData = webData else {
                completionHandler(nil, apiError)
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [String: Any]
                
                completionHandler(jsonResponse, nil)
            }
            catch {
                print(error.localizedDescription)
                completionHandler(nil, error)
            }
        }
        
        dataTask.resume()
    }
}
