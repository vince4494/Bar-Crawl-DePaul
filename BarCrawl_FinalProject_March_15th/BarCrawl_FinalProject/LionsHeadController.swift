//
//  LionsHeadController.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/18/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LionsHeadViewController: UIViewController
{
    @IBOutlet weak var Map: MKMapView!
    
    let locationManager = CLLocationManager()
    @IBOutlet var LionsHeadTableView: UITableView!
    
    
    
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
        cells.LionsHeaddealDays.text = dealDays[indexPath.row]
        return cells
        
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dealDays = ["Moday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        beerArray = ["-$4 Svedka Drinks\n" + "-$3 20oz. Coors Light Drafts\n" + "-$3 20oz. Miller Lite Drafts\n" + "-$15 Miller Lite Buckets\n" + "-$15 Coors Light Buckets(7pm-9pm)", // Monday
            "-$1 12oz. PBR Cans" + "-$2 Domestic Drafts\n" + "-$5 Patron Shots\n" + "$5 Jamo Shots\n" + "$4 Deep Eddy Vokda", // Tuesday
            "-$4 Goose Island Drafts" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "-$2 Budweiser Drafts(7pm-9pm)", // Wednesday
            "-$1 Bud Family Bottles\n" + "$1 Shock Tops Drafts\n" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "$2 Budweiser Drafts(7pm-9pm)", // Thursday
            "-$1 Rolling Rock Cans" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "-$2 Budweiser Drafts(7pm-9pm)", // Friday
            "-Brunch (10am-3pm)",// Saturday
            "-$1 Mimoas"] //Sunday
        
        foodArray = ["-$7.99 12oz New York Strip Steak", //Monday
            "-$1 Spicy Chicken Tacos(4pm-10pm)", //Tuesday
            "-25¢ Wings", // Wednesday
            "-$1 Pizza Slices", // Thursday
            "-$20 Meal Package(7pm-11pm)", // Friday
            "-Brunch (10am-3pm)\n" + "-$20 Meal Package", // Saturday
            "-Brunch (9am-3pm)"] // Sunday
        
        let location = CLLocationCoordinate2DMake(41.923184,-87.645155)
        let span = MKCoordinateSpanMake(0.0004,0.0004)
        let region = MKCoordinateRegion(center: location, span:span)
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Lions Head Pub"
        annotation.subtitle = "2251 N Lincoln Ave, Chicago, IL 60614"
        
        Map.addAnnotation(annotation)
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        
        let indexPath : NSIndexPath = LionsHeadTableView.indexPathForSelectedRow!
        LionsHeadTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let DestViewController = segue.destinationViewController as! LionsHeadDailyDeals
        DestViewController.beerString = beerArray[indexPath.row]
        DestViewController.foodString = foodArray[indexPath.row]
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
   