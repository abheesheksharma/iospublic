//
//  ViewController.swift
//  KeyChainSharing
//
//  Created by trainee on 13/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    
    let keyChain = KeychainWrapper.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        chkKeyChainData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnChngName(_ sender: Any) {
        keyChain.set(txtFldName.text!, forKey: "Name")
        chkKeyChainData()
    }
    
    @IBAction func btnClearName(_ sender: Any) {
        keyChain.removeObject(forKey: "Name")
//        keyChain.set("", forKey: "Name")
        chkKeyChainData()
    }
    
    func chkKeyChainData(){
        let text = keyChain.string(forKey: "Name")
        
        lblName.text = text ?? "Your Name Display Here"
    }
    
}

