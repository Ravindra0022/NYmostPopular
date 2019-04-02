//
//  DetailedViewController.swift
//  swiftyjson
//
//  Created by Ravindra Kumar Sharma on 02/04/19.
//  Copyright © 2019 Yogesh Patel. All rights reserved.
//

import UIKit
import WebKit

class DetailedViewController: UIViewController,WKNavigationDelegate {
  
    var urlStr : String?
    
    @IBOutlet weak var webView: WKWebView!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let url = URL(string: urlStr!)
        let myBlog = urlStr!
        let url = NSURL(string: myBlog)
        let request = NSURLRequest(url: url! as URL)
        
        // init and load request in webview.
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubview(toBack: webView)
//        wbView.loadRequest(URLRequest(url: url!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
