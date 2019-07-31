//
//  WebViewController.swift
//  weatherData
//
//  Created by IMCS2 on 7/30/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: trueUrl)
        let urlrequest = URLRequest(url: url!)
        webView.load(urlrequest)
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
