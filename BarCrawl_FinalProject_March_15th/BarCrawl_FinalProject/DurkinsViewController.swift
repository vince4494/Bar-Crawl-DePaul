//
//  DurkinsViewController.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/20/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DurkinsViewController: UIViewController
{
    @IBOutlet weak var Map: MKMapView!
    
    let locationManager = CLLocationManager()
    @IBOutlet var DurkinsTableView: UITableView!
    
    
    
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
        cells.DurkinsdealDays.text = dealDays[indexPath.row]
        return cells
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dealDays = ["Moday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        beerArray = [
            "-$4 Fireball Shots\n" + "-$3 Bud Light Drafts", // Monday
            "-$3 Drafts\n" + "$3 Pinnacle Cocktails\n" + "-$4 Fireball Shots", // Tuesday
            "-$3 Craft Beers\n" + "-$3 Bud Light Drafts\n" + "-$4 Fireball Shots", // Wednesday
            "-0.50 cent Bud Light Drafts\n" + "-$3 Jim Beam Cocktails\n" + "-$4 Fireball Shots", // Thursday
            "-$4 Fireball Shots\n" + "-$3 Bud Light Drafts",// Friday
            "-$4 Fireball Shots\n" + "$-3 Bud Light Drafts\n" + "$3 Shock Top Drafts\n" + "-$3 Jim Beam Cocktails", // Satruday
            "-$4 Fireball Shots\n" + "-$4 You Call Its\n" + "-$3 Bud Light Drafts"] //Sunday
        
        foodArray = ["-No Food Deals", //Monday
            "-No Food Deals", //Tuesday
            "-No Food Deals", // Wednesday
            "-No Food Deals", // Thursday
            "-No Food Deals", // Friday
            "-No Food Deals", // Saturday
            "-No Food Deals"] // Sunday
        
        
        let location = CLLocationCoordinate2DMake(41.932896,-87.649517)
        let span = MKCoordinateSpanMake(0.0004,0.0004)
        let region = MKCoordinateRegion(center: location, span:span)
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Durkin's"
        annotation.subtitle = "810 W Diversey Pkwy, Chicago, IL 60614"
        
        Map.addAnnotation(annotation)
        
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        
        let indexPath : NSIndexPath = DurkinsTableView.indexPathForSelectedRow!
        DurkinsTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let DestViewController = segue.destinationViewController as! DurkinsDailyDeals
        DestViewController.beerString = beerArray[indexPath.row]
        DestViewController.foodString = foodArray[indexPath.row]
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}