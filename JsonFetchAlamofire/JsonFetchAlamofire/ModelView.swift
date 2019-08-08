//
//  ModelView.swift
//  JsonFetchAlamofire
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON



class ModelView: NSObject{
    
//    var allJsonStructObj = AllJsonStruct()
    
    var nameStr = String()
    var friendsStr = [String]()
    
    func handelData(_ dict : JSON) {
        
        nameStr = dict["name"].stringValue
        //totalFriendSectionInt = dict["friends"].count
        
//        emailStr = dict["email"].stringValue
//        friend1Str = dict["friends"][0]["name"].stringValue
//        friend2Str = dict["friends"][1]["name"].stringValue
//        friend3Str = dict["friends"][2]["name"].stringValue
//
//        tag1Str = dict["tags"][0].stringValue
//        tag2Str = dict["tags"][1].stringValue
//        tag3Str = dict["tags"][2].stringValue
        
    }
    
    func handelFriendData(_ dict : JSON){
        friendsStr.append(dict["name"].stringValue)
        //friendsStr = dict["name"].stringValue
    }
}







