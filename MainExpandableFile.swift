import UIKit
struct ExpandableNames {
    var isExpanded = Bool()
    var names = [String]()
    var title = String()
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var twoDimensionalArray = [
        ExpandableNames(isExpanded: true, names: ["Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mary"], title: "Title1"),
        ExpandableNames(isExpanded: true, names: ["Carl", "Chris", "Christina", "Cameron"], title: "Titlex"),
        ExpandableNames(isExpanded: true, names: ["David", "Dan"], title: "Title2"),
        ExpandableNames(isExpanded: true, names: ["Patrick", "Patty"], title: "Title13"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        
        
        headerView.actionBtn.setTitleColor(.black, for: .normal)
        headerView.actionBtn.backgroundColor = .yellow
        
       headerView.actionBtn.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        headerView.actionBtn.tag = section
        
        
        headerView.actionLbl.text = twoDimensionalArray[section].title
        
         headerView.actionBtn.setTitle(twoDimensionalArray[section].isExpanded ? "Close" : "Open", for: .normal)
     
        
        
        return headerView
    }
    
   @objc func handleExpandClose(actionBtn: UIButton) {
        
        let section = actionBtn.tag
        
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
      
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        //actionBtn.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        
      if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
           tableView.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        
        return twoDimensionalArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = twoDimensionalArray[indexPath.section].names[indexPath.row]
        
        cell.textLabel?.text = name
        return cell
    }
    
}
