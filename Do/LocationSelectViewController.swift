//
//  LocationSelectViewController.swift
//  Do
//
//  Created by Tom Nadarajan on 7/1/21.
//

import UIKit
import MapKit

class LocationSelectViewController: UIViewController, MKMapViewDelegate {
    var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: self.view.frame)
        self.view.addSubview(mapView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
