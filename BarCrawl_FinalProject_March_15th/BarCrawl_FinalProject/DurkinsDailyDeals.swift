//
//  DurkinsDailyDeals.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 3/2/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//


import Foundation
import UIKit

class DurkinsDailyDeals: UIViewController {
    
    @IBOutlet var beerView: UITextView!
    @IBOutlet var foodView: UITextView!
    //@IBOutlet var webView: UIWebView!
    
    
    var beerString = String()
    var foodString = String()
    
    override func viewDidLoad()
    {
        
        
        beerView.text = beerString
        foodView.text = foodString
        
        
        
        //let requestUrl = NSURL(string:"http://www.bar1events.com/durkins/sg_userfiles/NewMenu.pdf")
        //let request = NSURLRequest(URL:requestUrl!)
        //webView.loadRequest(request)
        
    }
    
    
}
