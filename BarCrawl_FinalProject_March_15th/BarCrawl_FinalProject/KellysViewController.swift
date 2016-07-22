//
//  File.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/16/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation


class KellysViewController: UIViewController
{
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet var KellysTableView: UITableView!
    
    
    let locationManager = CLLocationManager()
    
    var dealDays = [String]()
    var beerArray = [String]()
    var foodArray = [String]()
    
  
    
    func tableView(tableView: UITableView, numberOfRowsInSection:Int)-> Int
    {
        return 7
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cells = tableView.dequeueReusableCellWithIdentifier("dealDays", forIndexPath: indexPath) as! CustomTableViewCell
        cells.KellysdealDays.text = dealDays[indexPath.row]
        return cells
        
        
    }
    
    override func viewDidLoad()
    {
    
        super.viewDidLoad()
        dealDays = ["Moday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        beerArray = ["-$2 Bud Lights", // Monday
            "-$2 Bud Light Bottles\n" + "-$2 Budwesier Bottles", // Tuesday
            "-$3 Drafts", // Wednesday
            "-$8 Coors Light Pitchers\n" + "-$5 Bombs\n" + "-$3 Fireball Shots", // Thursday
            "-$4 Green Line Drafts\n" + "-$15 Bud Light Buckets\n" + "-$15 Budweiser Buckets", // Friday
            "-$12 Coors Light Buckets",// Saturday
            "-$15 Miller Lite Buckets\n" + "-$3 Lagunitas IPA\n" + "-$5 Bloody Marys"] //Sunday
        
        foodArray = ["-$1 Tacos", //Monday
            "-$2 Burgers\n" + "-$1 Fries", //Tuesday
            "-50¢ Wings", // Wednesday
            "-$5 Sandwiches", // Thursday
            "-No Food Deals", // Friday
            "-No Food Deals", // Saturday
            "-No Food Deals"] // Sunday
        
        let location = CLLocationCoordinate2DMake(41.921575,-87.652961)
        let span = MKCoordinateSpanMake(0.0004,0.0004)
        let region = MKCoordinateRegion(center: location, span:span)
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Kellys Pub"
        annotation.subtitle = "949 W Webster Ave, Chicago, IL 60614"
        
        Map.addAnnotation(annotation)
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        
        let indexPath : NSIndexPath = KellysTableView.indexPathForSelectedRow!
        KellysTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let DestViewController = segue.destinationViewController as! KellysDailyDeals
        DestViewController.beerString = beerArray[indexPath.row]
        DestViewController.foodString = foodArray[indexPath.row]
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}