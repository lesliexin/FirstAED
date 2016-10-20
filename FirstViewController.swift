//
//  ViewController.swift
//  AED-Finder
//
//  Created by Amy on 2016-05-21.
//  Copyright © 2016 Amy. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var theMapView: MKMapView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        class dataPoint{
            var latitude:CLLocationDegrees
            var longitude:CLLocationDegrees
            
            var location: CLLocationCoordinate2D{
                get {
                    return CLLocationCoordinate2DMake(latitude, longitude)
                }
                
            }
            
            var ourLocation = MKPointAnnotation()
            
            init(latitude:CLLocationDegrees, longitude:CLLocationDegrees){
                self.latitude = latitude
                self.longitude = longitude
                ourLocation.coordinate = location
                
            }
            
            func set() -> MKPointAnnotation{
                return ourLocation
            }
            
        }
        
        let originalPoint = dataPoint(latitude: 42.260281, longitude: -83.027893)
        
        var latDelta:CLLocationDegrees = 0.1
        var longDelta:CLLocationDegrees = 0.1
        
        let locationO: CLLocationCoordinate2D = CLLocationCoordinate2DMake(originalPoint.latitude, originalPoint.longitude)
        
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(locationO, theSpan)
        
        self.theMapView.setRegion(theRegion, animated: true)
        
        
        //putting down original pin (make different color later)
        
        self.theMapView.addAnnotation(originalPoint.ourLocation)
        originalPoint.ourLocation.title = "YOU ARE HERE"
        originalPoint.ourLocation.subtitle = "Vincent Massey Secondary School"
        
        //putting down some more AEDs in the area (better if these were in a data structure, but lol whatever, MVP)
        
        let p1 = dataPoint(latitude: 42.317, longitude: -83.04144)
        self.theMapView.addAnnotation(p1.ourLocation)
        p1.ourLocation.title = "Charles Clarke Square"
        p1.ourLocation.subtitle = "250 University Ave, Windsor, Ontario  N9A1J3"
        
        let p2 = dataPoint(latitude: 42.32505, longitude: -82.959663)
        self.theMapView.addAnnotation(p2.ourLocation)
        p2.ourLocation.title = "École Georges P. Vanier"
        p2.ourLocation.subtitle = "6200 Edgar Rue, Windsor, Ontario  N8S2A6"
        
        let p3 = dataPoint(latitude: 42.26009, longitude: -83.034791)
        self.theMapView.addAnnotation(p3.ourLocation)
        p3.ourLocation.title = "École Monseigneur Jean-Noël"
        p3.ourLocation.subtitle = "3225 California Rue, Windsor, Ontario  N9E3K5"
        
        let p4 = dataPoint(latitude: 42.277285, longitude: -83.019615)
        self.theMapView.addAnnotation(p4.ourLocation)
        p4.ourLocation.title = "École secondaire E.J. Lajeunesse"
        p4.ourLocation.subtitle = "600 E.C. Row, Windsor, Ontario  N9E1A5"
        
        let p5 = dataPoint(latitude: 42.290082, longitude: -83.047375)
        self.theMapView.addAnnotation(p5.ourLocation)
        p5.ourLocation.title = "École St-Edmond"
        p5.ourLocation.subtitle = "1880 Totten Rue, Windsor, Ontario  N9B1X3"
        
        let p6 = dataPoint(latitude: 42.317299, longitude: -83.044497)
        self.theMapView.addAnnotation(p6.ourLocation)
        p6.ourLocation.title = "Family Aquatic Centre"
        p6.ourLocation.subtitle = "401 Pitt St, Windsor, Ontario  N9A5M2"
        
        let p7 = dataPoint(latitude: 42.307535, longitude: -82.959603)
        self.theMapView.addAnnotation(p7.ourLocation)
        p7.ourLocation.title = "École Ste-Thérèse"
        p7.ourLocation.subtitle = "5305 Tecumseh Rue, Windsor, Ontario  N8T1C5"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
