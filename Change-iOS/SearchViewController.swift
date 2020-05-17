//
//  SearchViewController.swift
//  Change-iOS
//
//  Created by Leo Au-Yeung on 5/17/20.
//  Copyright © 2020 Leo Au-Yeung. All rights reserved.
//

import Foundation

//func getTrainTimes(){
//    let station = selectedStation.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//    let url = URL(string: "http://node-express-env.hfrpwhjwwy.us-east-2.elasticbeanstalk.com/trains/\(station)")!
//    URLSession.shared.dataTask(with: url) { data, response, error in
//       if let data = data {
//          do {
//            let result = try JSONDecoder().decode([Stop].self, from: data)
//            if(result.count > 0){
//                for i in 0...result.count-1{
//                    if(result[i].North.count > 0) {
//                    let train = result[i].TrainNumber
//                        self.saveToDictionary(list: result[i].North, withKey: train)
//                        self.saveToDictionary(list: result[i].South, withKey: train)
//                    }
//                }
//            }
//            self.reloadTable()
//          } catch let error {
//             print(error)
//          }
//       }
//    }.resume()
//}
//
//func reloadTable() {
//    DispatchQueue.main.async {
//        self.TableView.reloadData()
//    }
//}
