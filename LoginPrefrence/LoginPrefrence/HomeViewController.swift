//
//  HomeViewController.swift
//  LoginPrefrence
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var checkLogin = String()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var lblEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showEmail()
    }
    
    func showEmail(){
        let emailStr = self.defaults.value(forKey: "Email")
        self.lblEmail.text = emailStr as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        defaults.set(false, forKey: checkLogin)
        defaults.set("", forKey: "Email")
        
        self.navigationController?.popToRootViewController(animated:false)
    }
    
}
