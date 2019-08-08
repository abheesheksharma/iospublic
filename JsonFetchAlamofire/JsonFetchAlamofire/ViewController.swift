//
//  ViewController.swift
//  JsonFetchAlamofire
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var jsonTableView: UITableView!
    var jsonData = JSON()
    var modelViewArr = [ModelView]()
    
    var modelViewSectionArr = [ModelView]()
    
    var numberOfFriends = [Int]()
    
    var mainIndexInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json"
        
        Alamofire.request(url).responseJSON { (data) in
            if (data.result.value != nil){
                self.jsonData = JSON(data.result.value as Any)
                
                for i in 0...self.jsonData.count-1{
                    let modelViewObj = ModelView()
                    
                    modelViewObj.handelData(self.jsonData[i])
                    
                    self.modelViewArr.append(modelViewObj)
                    
                    self.numberOfFriends.append(self.jsonData[i]["friends"].count)
                    
                    for j in 0...self.jsonData[i]["friends"].count-1{
                        let modelViewFriendsObj = ModelView()
                        modelViewFriendsObj.handelFriendData(self.jsonData[i]["friends"][j])
                        
                        self.modelViewSectionArr.append(modelViewFriendsObj)
                    }
                    
                }
                
                self.jsonTableView.reloadData()
            }else{
                print("error")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return modelViewSectionArr[section].totalFriendSectionInt!
        return numberOfFriends[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jsonTableView.dequeueReusableCell(withIdentifier: "JSONTableViewCell", for: indexPath) as! JSONTableViewCell
        cell.friend1Lbl.text = modelViewSectionArr[mainIndexInt].friendsStr
        print(modelViewSectionArr[mainIndexInt].friendsStr as Any)
        mainIndexInt = mainIndexInt + 1
        
        print(mainIndexInt)
        
//        cell.nameLbl.text = modelViewArr[indexPath.row].nameStr
//        cell.emailLbl.text = modelViewArr[indexPath.row].emailStr
//        cell.friend1Lbl.text = modelViewArr[indexPath.row].friend1Str
//        cell.friend2Lbl.text = modelViewArr[indexPath.row].friend2Str
//        cell.friend3Lbl.text = modelViewArr[indexPath.row].friend3Str
        
//        cell.tag1Lbl.text = modelViewArr[indexPath.row].tag1Str
//        cell.tag2Lbl.text = modelViewArr[indexPath.row].tag2Str
//        cell.tag3Lbl.text = modelViewArr[indexPath.row].tag3Str
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelViewArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return modelViewArr[section].nameStr
    }
    
    
    
    
}

