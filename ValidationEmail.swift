import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var showNameAlert: UILabel!
    
    @IBOutlet weak var showFatherNameAlert: UILabel!
    @IBOutlet weak var fatherNameField: UITextField!
    
    @IBOutlet weak var showNameLbl: UILabel!
    @IBOutlet weak var showFatherLbl: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func showAlertBtn(_ sender: Any) {
      
        let alert = UIAlertView()
        
       if nameField.text == ""{
            showNameAlert.text = "Enter Password"
            alert.title = "Enter your name"
            //alert.message = "This is message"
            alert.addButton(withTitle: "Ok")
            alert.show()
        
        }else if fatherNameField.text == ""{
        
              showFatherNameAlert.text = "Father Name Required"
                alert.title = "Enter your father name"
                //alert.message = "This is message"
                alert.addButton(withTitle: "Ok")
                alert.show()
       }else if fatherNameField.text != ""{
                let checkEm = fatherNameField.text
                let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPredict = NSPredicate(format: "SELF MATCHES %@", emailFormat)
                if emailPredict.evaluate(with: checkEm){
                showFatherLbl.text = fatherNameField.text
                showFatherNameAlert.text = ""
        }
        else{
            alert.title = "Invalid email"
            alert.addButton(withTitle: "Ok I will Fix them")
            alert.show()
        }
        
    }
        
        
        if nameField.text != ""{
            showNameLbl.text = nameField.text
            showNameAlert.text = ""
        }
    }
}

//This is delegate of uitextfield and I used this for set limit in specific uitextfield
extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = nameField.text else { return true }
            let newLength = text.count + string.count - range.length
        print(range.length)
            showNameAlert.text = "Do not exceed more than 10"
            return newLength <= 10
    }
}
