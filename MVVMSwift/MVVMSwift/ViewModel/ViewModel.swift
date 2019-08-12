//
//  ViewModel.swift
//  MVVMSwift
//
//  Created by trainee on 09/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ViewModel: NSObject {
    
    var reloadStudentList = {() -> () in }
    var modelObj = [Model]()   // array
    var jsonData = JSON()    // json file
    
    
    func hitApi(){
        
        let url = "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json"
        Alamofire.request(url).responseJSON { (data) in
            
            if data.result.value != nil{
                
                self.jsonData = JSON(data.result.value as Any)
                
                for i in 0...self.jsonData.count-1{
                    let modelViewObj = Model()
                    
                    modelViewObj.handelData(self.jsonData[i])
                    self.modelObj.append(modelViewObj)
                    print(self.jsonData[i]["name"].stringValue)
                
                }
            
                self.reloadStudentList()
                
            }else{
                print("Error")
            }
        }
    }
}
