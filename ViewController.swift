//
//  ViewController.swift
//  ExpandableTableRow
//
//  Created by trainee on 28/06/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}



class ViewController: UIViewController {
    
    var tableviewData = [cellData]()
    @IBOutlet weak var tableView: UITableView!
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableviewData = [cellData(opened: false, title: "Vegetables", sectionData: ["Potato", "Tomato", "Cauliflower"]),
                         cellData(opened: false, title: "Fruits", sectionData: ["Name", "Tomato", "Cauliflower"]),
            cellData(opened: false, title: "Fast Food", sectionData: ["Potato", "Tomato", "Cauliflower"])
            
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension ViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
            return tableviewData.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0{
            if tableviewData[indexPath.section].opened == true{
                tableviewData[indexPath.section].opened = false
                //cells.actionLabel?.text = "close"
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
            else{
                tableviewData[indexPath.section].opened = true
                //cells.actionLabel?.text = "open"
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(tableviewData[section].title)
    }
    
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableviewData[section].opened == true){
            return tableviewData[section].sectionData.count + 1
        }
        else{
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCellsFile
        
        if indexPath.row == 0{
            cells.pointsText?.text = tableviewData[indexPath.section].title
             if(tableviewData[indexPath.section].opened == true){
                   cells.actionLabel?.text = "close"
             }else{
                   cells.actionLabel?.text = "open"
            }
            return cells
        }
        else{
           
        cells.pointsText?.text = tableviewData[indexPath.section].sectionData[indexPath.row-1]
            cells.actionLabel?.text = ""
            
             //cells.pointsText?.text = tableviewData[indexPath.section].title
      //  cells.pointsText?.text = tableviewData[indexPath.section].title
            return cells
        }
    }
}
