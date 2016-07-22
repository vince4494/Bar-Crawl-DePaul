//
//  KellysDailyDeals.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/20/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import Foundation
import UIKit

class KellysDailyDeals: UIViewController {
    
    @IBOutlet var beerView: UITextView!
    @IBOutlet var foodView: UITextView!
    
    
    var beerString = String()
    var foodString = String()
    
    
    override func viewDidLoad()
    {
        
        
        beerView.text = beerString
        foodView.text = foodString
        
        //no picture menu posted online
        
        
    }
}