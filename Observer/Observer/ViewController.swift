//
//  ViewController.swift
//  Observer
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(facebook(notification:)), name: .fbName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(twitter(notification:)), name: .twitterName, object: nil)
    
    }
    
    @objc func facebook(notification: Notification){
        lblName.text = "Facebook"
    }
    
    @objc func twitter(notification: Notification){
        lblName.text = "Twitter"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnChoose(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        //present(nextVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func goVC3(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        //present(nextVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

extension Notification.Name{
    static let fbName = Notification.Name("Facebook")
    static let twitterName = Notification.Name("Twitter")
}

