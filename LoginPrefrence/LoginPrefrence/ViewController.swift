//
//  ViewController.swift
//  LoginPrefrence
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    let defaults = UserDefaults.standard
    var checkLogin = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        checkLoggedInPrefrence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLogin(_ sender: Any) {
        defaults.set(true, forKey: checkLogin)
        defaults.set(txtFldEmail.text!, forKey: "Email")
        checkLoggedInPrefrence()
    }
    
    func checkLoggedInPrefrence(){
        let check = defaults.bool(forKey: checkLogin)
        
        if check {
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    
}

