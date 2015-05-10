//
//  ViewController.swift
//  MyLocationApp
//
//  Created by Anthony Liekens on 10/05/15.
//  Copyright (c) 2015 Anthony Liekens. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  let locationManager = CLLocationManager()
  
  @IBOutlet weak var latitudeLabel: UILabel!
  @IBOutlet weak var longitudeLabel: UILabel!
  @IBOutlet weak var accuracyLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
    NSLog("loaded")
  }
  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    self.latitudeLabel.text = manager.location.coordinate.latitude.description
    self.longitudeLabel.text = manager.location.coordinate.longitude.description
    self.accuracyLabel.text = manager.location.horizontalAccuracy.description + "m"
  }
  
  func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    NSLog("Error while updating location " + error.localizedDescription)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

