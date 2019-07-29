import Foundation
import UIKit


class DictModel : NSObject{
    var nameStr: String?
    var classStr: String?
  
    func handelData(_ dict: NSMutableDictionary)  {
        nameStr = dict["name"] as? String
        classStr = dict["class"] as? String
    }
   
}
