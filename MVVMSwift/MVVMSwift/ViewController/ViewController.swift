import UIKit
class ViewController: UIViewController {

    //MARK: Outlets

    @IBOutlet weak var tableViewFriends: UITableView!
    
    //MARK: Objects
    var viewModelObj = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelObj.hitApi()
        
        
        viewModelObj.reloadStudentList = {
            [weak self] ()  in
            self?.tableViewFriends.reloadData()
        }
        
       // print(viewModelObj.modelObj.count)
    }
    
    //MARK: Functions
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModelObj.modelObj.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewFriends.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        cell.LblName.text = viewModelObj.modelObj[indexPath.row].nameStr
        
        return cell
    }

    
    
}

