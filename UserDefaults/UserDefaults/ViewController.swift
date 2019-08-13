import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtFieldName: UITextField!
    
    //MARK: Variables
    let defaults = UserDefaults.standard
    var nameStr = "Default Name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPrefrence()
    }

    //MARK: Button Actions
    @IBAction func btnChangeDefaults(_ sender: Any) {
       // nameStr = txtFieldName.text!
        
        defaults.set(txtFieldName.text!, forKey: nameStr)
        
       // defaults.set(true, forKey: nameStr)
        
        checkPrefrence()
    }
    
    //MARK: Functions
    func checkPrefrence() {
            let name = defaults.value(forKey: nameStr) as? String ?? ""
                lblName.text = name
    }
    
}

