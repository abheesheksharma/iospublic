import UIKit
import Contacts

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var classField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!    
   
    var arrDictModel = [DictModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addNewData(_ sender: Any) {
        
                let dataDict = NSMutableDictionary()
        dataDict.setValue(nameField.text!, forKey: "name")
        dataDict.setValue(classField.text!, forKey: "class")
       
        let objDictModel = DictModel()
        
        objDictModel.handelData(dataDict)
        
        arrDictModel.append(objDictModel)
        
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDictModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.nameLbl.text = arrDictModel[indexPath.row].nameStr
        cell.classLbl.text = arrDictModel[indexPath.row].classStr
   
        return cell
    }
    

}

