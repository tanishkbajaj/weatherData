//
//  ViewController.swift
//  weatherData
//
//  Created by IMCS2 on 7/29/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit
import WebKit

var trueUrl = ""
class ViewController: UIViewController {
    
    var editedStr: [String] = []
    @IBOutlet weak var webView: WKWebView!
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var DisplayTextWeather: UITextView!
    
    let firstStrUrl = "https://www.weather-forecast.com/locations/"
    let secondStrUrl = "/forecasts/latest"
    
    var beforeStr = """
<th></th><td class="b-forecast__table-description-cell--js" colspan="9"><span class="b-forecast__table-description-title"><h2>
"""
    
    var afterStr = """
    </span></p></td><td class="b-forecast__table-description-cell--js" colspan="9"><span class="b-forecast__table-description-title"><h2>
    """
    
    
    @IBAction func submitButton(_ sender: Any) {
        

       
        
        var combinedstrUrl = firstStrUrl + textField.text! + secondStrUrl
         trueUrl = combinedstrUrl.replacingOccurrences(of: " ", with: "-")
        let url = URL(string: trueUrl)
      
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error==nil {
                if let unwrapData = data{
                    let dataString = String(data: unwrapData, encoding: .utf8)
                   
                    
                    if((dataString?.contains("You may have mistyped the address"))!) {
                        
                        DispatchQueue.main.async {
                        self.DisplayTextWeather.text = "Wrong city or state name"
                        }
                        }else {
                  
                    
                    
                        var newSTR = dataString?.components(separatedBy: self.beforeStr)
                    
                    
                  
                    
                        self.editedStr = newSTR![1].components(separatedBy: self.afterStr)
                    
                    
                    
                    DispatchQueue.main.async {
                        let str = self.editedStr[0].replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                        let parsed = str.replacingOccurrences(of: "(1&ndash;3 days)", with: "")
                      
                        self.DisplayTextWeather.text = parsed
                    }
                    
                    
                }
                
                
                
            }
            
        }
        }
        
        task.resume()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "image.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    
}

