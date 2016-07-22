//
//  HeadQuartersControllers.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/18/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HeadQuartersViewController: UIViewController
{
    @IBOutlet weak var Map: MKMapView!
    
    let locationManager = CLLocationManager()
    @IBOutlet var HeadQuartersTableView: UITableView!
    
    
    
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
        cells.HeadQuartersdealDays.text = dealDays[indexPath.row]
        return cells
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dealDays = ["Moday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        beerArray = ["-No Drinks Deals", // Monday
            "-$11 Beer Flights", // Tuesday
            "-$5 Craft Cans\n" + "$5 Assault & Pepper Cocktail\n" + "$5 Apple Cinnamon Jameson Cocktails", // Wednesday
            "-$5 Moscow Mules\n" + "$5 Assault & Pepper Cocktail\n" + "$5 Mott's Cocktail", // Thursday
            "No Drink Deals", // Friday
            "No Drink Deals",// Saturday
            "50% off Service Industry Employees"] //Sunday
        
        foodArray = ["-No Food Deals", //Monday
            "-No Food Deals", //Tuesday
            "$20 for 2 Beers, 2 Shots, & @ Pizza Slices Combo", // Wednesday
            "-No Food Deals", // Thursday
            "-No Food Deals     ", // Friday
            "-No Food Deals", // Saturday
            "50% off Service Industry Employees"] // Sunday
        
        let location = CLLocationCoordinate2DMake(41.933745,-87.653610)
        let span = MKCoordinateSpanMake(0.0004,0.0004)
        let region = MKCoordinateRegion(center: location, span:span)
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Headquarters Beercade"
        annotation.subtitle = " 2833 N Sheffield Ave, Chicago, IL 60657"
        
        Map.addAnnotation(annotation)
        
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        
        let indexPath : NSIndexPath = HeadQuartersTableView.indexPathForSelectedRow!
        HeadQuartersTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let DestViewController = segue.destinationViewController as! HeadQuartersDailyDeals
        DestViewController.beerString = beerArray[indexPath.row]
        DestViewController.foodString = foodArray[indexPath.row]
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}