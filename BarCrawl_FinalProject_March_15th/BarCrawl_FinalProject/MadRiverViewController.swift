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

class MadRiverViewController: UIViewController
{
    @IBOutlet weak var Map: MKMapView!
    
    let locationManager = CLLocationManager()
    @IBOutlet var MadRiverTableView: UITableView!
    
    
    
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
        cells.MadRiverdealDays.text = dealDays[indexPath.row]
        return cells
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dealDays = ["Moday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        beerArray = ["-$7 Signature Cocktails", // Monday
            "-$3 Strongbow Drafts\n" + "-$4 Select Drafts\n" + "-$5 Lagunitas IPA Drafts\n" + "-$5 Fireball", // Tuesday
            "-$4 Jameson\n" + "$4 Absolut\n" + "-$5 Jack Daniels\n" + "-$15 Miller Lite Buckers\n" + "-$15 Coors Light Buckets", // Wednesday
            "-$3 Domestic Drafts\n" + "-$5 Bombs\n" + "-$4 Call Cocktails\n" + "-$4 Fireball", // Thursday
            "No Drink Deals", // Friday
            "No Drink Deals",// Saturday
            "-$3 22oz Drafts\n" + "-$5 Fireball Shots\n" + "-$5 Eagle Bombs\n" + "-$12 Pitchers"] //Sunday
        
        foodArray = ["-$10 Burger/Sandwich & Beer", //Monday
            "-1/2 Off Appetizers" + "-1/2 Off Pizzas", //Tuesday
            "-1/2 Off Salads\n" + "-1/2 Off Wraps", // Wednesday
            "-1/2 Off Burgers", // Thursday
            "-1/2 Off Appetizers(5pm-8pm)", // Friday
            "-No Food Deals", // Saturday
            "-No Food Deals"] // Sunday
        
        let location = CLLocationCoordinate2DMake(41.934799,-87.653620)
        let span = MKCoordinateSpanMake(0.0004,0.0004)
        let region = MKCoordinateRegion(center: location, span:span)
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Mad River Bar and Grille"
        annotation.subtitle = "2909 N Sheffield Ave, Chicago, IL 60657"
        
        Map.addAnnotation(annotation)
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        
        let indexPath : NSIndexPath = MadRiverTableView.indexPathForSelectedRow!
        MadRiverTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let DestViewController = segue.destinationViewController as! MadRiverDailyDeals
        DestViewController.beerString = beerArray[indexPath.row]
        DestViewController.foodString = foodArray[indexPath.row]
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}