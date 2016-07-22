//
//  HeadQuartersDailyDeals.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 3/2/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import Foundation
import UIKit

class HeadQuartersDailyDeals: UIViewController {
    
    @IBOutlet var beerView: UITextView!
    @IBOutlet var foodView: UITextView!
    //@IBOutlet var webView: UIWebView!
    
    
    
    var beerString = String()
    var foodString = String()
    
    override func viewDidLoad()
    {
        
        
        beerView.text = beerString
        foodView.text = foodString
        
        
        
        //let requestUrl = NSURL(string:"http://hqbeercade.com/rivernorth/wp-content/uploads/2016/01/HQ-DINNER-JANUARY-2016.pdf")
        //let request = NSURLRequest(URL:requestUrl!)
        //webView.loadRequest(request)
        
    }
    
    
}
