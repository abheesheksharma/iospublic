import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    //MARK: Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var txtFldURL: UITextField!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet var viewMain: UIView!
    @IBOutlet weak var btnGoForwardOut: UIButton!
    @IBOutlet weak var btnGoBackOut: UIButton!
    @IBOutlet weak var btnReloadOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicatorView.isHidden = true
        webView.navigationDelegate = self
        webView.scrollView.bounces = false
        btnGoForwardOut.isEnabled = false
        btnGoBackOut.isEnabled = false
        btnReloadOut.isEnabled = false
    }
    
    //MARK: Search Button Action
    @IBAction func btnSearchAction(_ sender: Any) {
        startIndicator()
        
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: txtFldURL.text!)
        guard result else {
            let encodeURL = "https://www.google.com/search?q=\(txtFldURL.text!)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let searchURL = NSURL(string: encodeURL!)
//            let encodeURL = URL(fileURLWithPath: "https://www.google.com/search?q=\(txtFldURL.text!)")
            txtFldURL.text = String(describing: searchURL!)
            let request = URLRequest(url: searchURL as! URL)
            webView.load(request)
            return
        }
        let searchURL = NSURL(string: txtFldURL.text!)
        let request = URLRequest(url: searchURL as! URL)
        
        webView.load(request)
    }
    
    @IBAction func btnGoBackAction(_ sender: Any) {
        startIndicator()
        webView.goBack()
    }
    
    @IBAction func btnGoForwardAction(_ sender: Any) {
        startIndicator()
        webView.goForward()
    }
    
    @IBAction func btnGoHome(_ sender: Any) {
        
    }
    
    @IBAction func btnReloadWebView(_ sender: Any) {
        startIndicator()
        webView.reload()
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == WKNavigationType.linkActivated {
            startIndicator()
            txtFldURL.text = String(describing: navigationAction.request.url!)
            
            decisionHandler(WKNavigationActionPolicy.allow)
            return
        }
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       stopIndicator()
        
    }
    
    //MARK: Indicator Functions
    func stopIndicator(){
        checkGoBackForward()
        indicatorView.stopAnimating()
        indicatorView.isHidden = true
        viewMain.alpha = 1
    }
    
    func startIndicator(){
        checkGoBackForward()
        viewMain.alpha = 0.6
        indicatorView.isHidden = false
        indicatorView.startAnimating()
    }
    
    func checkGoBackForward(){
         btnReloadOut.isEnabled = true
        if webView.canGoBack{
            btnGoBackOut.isEnabled = true
           
        }
        if webView.canGoForward{
            btnGoForwardOut.isEnabled = true
        }
    }
}

