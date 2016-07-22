//
//  MadRiverDailyDeals.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/26/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import Foundation
import UIKit

class MadRiverDailyDeals: UIViewController {
    
    @IBOutlet var beerView: UITextView!
    @IBOutlet var foodView: UITextView!
    //@IBOutlet var webView: UIWebView!
    
    
    var beerString = String()
    var foodString = String()
    
    override func viewDidLoad()
    {
        
        
        beerView.text = beerString
        foodView.text = foodString
        
        //let requestUrl = NSURL(string:"http://media.wix.com/ugd/052b37_679ebe12d17242e5b9e2262739a89503.pdf")
        //let request = NSURLRequest(URL:requestUrl!)
        //webView.loadRequest(request)
        
        
    }
    
    
}