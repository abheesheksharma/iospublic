//
//  SecondViewController.swift
//  Observer
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnFb(_ sender: Any) {
        NotificationCenter.default.post(name: .fbName, object: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnTwitter(_ sender: Any) {
        NotificationCenter.default.post(name: .twitterName, object: nil)
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}
