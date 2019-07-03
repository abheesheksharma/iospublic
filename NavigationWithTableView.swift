import UIKit
class ViewController10: UIViewController , UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var tblView: UITableView!
  
    var lblArr = ["K","KARTIK"]
    var imgArr = ["k","kartik"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource =  self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lblArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellVC10") as! TableViewCellVC10
        cell.lbl2.text = lblArr[indexPath.row]
        let img = UIImage(named:imgArr[indexPath.row])
        cell.imgView.image = img
       
        cell.ViewBtn.tag = indexPath.row
        cell.ViewBtn.addTarget(self, action: #selector(viewBtnClicked(sender:)), for: .touchUpInside)
        print ("hello")
        return cell
        
    }

    @objc func viewBtnClicked(sender:UIButton){
        
        let moveToNextVC11 = storyboard?.instantiateViewController(withIdentifier: "ViewController11" ) as!
        ViewController11
       
        moveToNextVC11.abc = lblArr[sender.tag]
        
        moveToNextVC11.def = UIImage(named :imgArr[sender.tag])!
        print ("hii")
        
        self.navigationController?.pushViewController(moveToNextVC11, animated: true)

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
