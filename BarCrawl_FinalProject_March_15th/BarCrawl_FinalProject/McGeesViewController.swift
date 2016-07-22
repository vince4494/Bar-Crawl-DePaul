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


class McGeesViewController: UIViewController
{
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet var McGeesTableView: UITableView!
    
    
    
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
        cells.McGeesdealDays.text = dealDays[indexPath.row]
        return cells
        
        
    }
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        dealDays = ["Moday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        beerArray = ["-$3 Shock Tops\n" + "-$3 Green Line Drafts\n" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "-$2 Budweiser Drafts(7pm-9pm)", // Monday
            "-$15 Bud Family Buckets" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "-$2 Budweiser Drafts(7pm-9pm)", // Tuesday
            "-$4 Goose Island Drafts" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "-$2 Budweiser Drafts(7pm-9pm)", // Wednesday
            "-$1 Bud Family Bottles\n" + "$1 Shock Tops Drafts\n" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "$2 Budweiser Drafts(7pm-9pm)", // Thursday
            "-$1 Rolling Rock Cans" + "-$2 Bud Lights Drafts(7pm-9pm)\n" + "-$2 Budweiser Drafts(7pm-9pm)", // Friday
            "-Brunch (10am-3pm)",// Saturday
            "-$1 Mimoas"] //Sunday
        
        foodArray = ["-$1 Sliders", //Monday
            "-Half off Appetizers", //Tuesday
            "-25¢ Wings", // Wednesday
            "-$1 Pizza Slices", // Thursday
            "-$20 Meal Package(7pm-11pm)", // Friday
            "-Brunch (10am-3pm)\n" + "-$20 Meal Package", // Saturday
            "-Brunch (9am-3pm)"] // Sunday
 
        let location = CLLocationCoordinate2DMake(41.921934,-87.652961)
        let span = MKCoordinateSpanMake(0.0004,0.0004)
        let region = MKCoordinateRegion(center: location, span:span)
        Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "McGees Pub"
        annotation.subtitle = "950 W Webster Ave, Chicago, IL 60614"
        
        Map.addAnnotation(annotation)
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        
        let indexPath : NSIndexPath = McGeesTableView.indexPathForSelectedRow!
        McGeesTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let DestViewController = segue.destinationViewController as! McGeesDailyDeals
        DestViewController.beerString = beerArray[indexPath.row]
        DestViewController.foodString = foodArray[indexPath.row]
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}