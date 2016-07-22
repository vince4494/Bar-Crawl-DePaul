//
//  McGeesDailyDeals.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/24/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import Foundation
import UIKit

class McGeesDailyDeals: UIViewController {
    
    @IBOutlet var beerView: UITextView!
    @IBOutlet var foodView: UITextView!
    @IBOutlet var webView: UIWebView!
    
    
    
    var beerString = String()
    var foodString = String()
    
    override func viewDidLoad()
    {
        
        
        beerView.text = beerString
        foodView.text = foodString
        
        let requestUrl = NSURL(string:"http://www.bar1events.com/mcgees/sg_userfiles/McGeesMenu.pdf")
        let request = NSURLRequest(URL:requestUrl!)
        webView.loadRequest(request)
        
        
    }
    
   
}