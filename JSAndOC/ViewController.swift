//
//  ViewController.swift
//  JSAndOC
//
//  Created by 薛焱 on 16/6/23.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var viewBtn: UIButton!
    var webBtnTitle:String!
    var i:NSInteger = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        webBtnTitle = "webBtn\(i)"
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let url = NSURL(fileURLWithPath: path!)
        let request = NSURLRequest(URL: url);
        webView.loadRequest(request)
    }

    @IBAction func viewBtnAction(sender: UIButton) {
        i += 1
        webBtnTitle = "webBtn\(i)"
        webView.reload()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        let jsStr = "test('" + webBtnTitle + "');"
        webView.stringByEvaluatingJavaScriptFromString(jsStr)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.URL)
        return true
    }
}

