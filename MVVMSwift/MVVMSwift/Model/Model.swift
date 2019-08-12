//
//  Model.swift
//  MVVMSwift
//
//  Created by trainee on 09/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import SwiftyJSON

class Model: NSObject{
    
    var nameStr : String?
    var classStr : String?
    
    func handelData(_ dict: JSON){
        nameStr = dict["name"].stringValue
    }
    
}
