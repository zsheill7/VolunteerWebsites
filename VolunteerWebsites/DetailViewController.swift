//
//  DetailViewController.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/5/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController, WKUIDelegate, UIWebViewDelegate {

    @IBOutlet weak var uiWebView: UIWebView!
    //var webView: WKWebView!

    var detailItem: Service? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        /*let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60), configuration: webConfiguration)
        webView.UIDelegate = self*/
       
        
       // view.addSubview(webView)
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        uiWebView.delegate = self
        
        if self.detailItem != nil {
            print("not nil")
            self.navigationItem.title = self.detailItem?.name
            let myURL = detailItem!.url
            
            let myRequest = NSURLRequest(URL: myURL)
            uiWebView.loadRequest(myRequest)
            
            
        }
        uiWebView.scalesPageToFit = true
      
        
       // self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

