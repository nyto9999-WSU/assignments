//
//  Map.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/26.
//

import UIKit
import CoreLocation
import MapKit
import Contacts

class Map: UIViewController {
    
    var adrs:String?
    var mapDistance : Double = 1500
    let searchRequest = MKLocalSearch.Request();
    
    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview.showsUserLocation = true
        searchRequest.naturalLanguageQuery = adrs
        searchRequest.region = mapview.region
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
               return
            }
            
            for item in response.mapItems {
                if let name = item.name,
                    let location = item.placemark.location {
                    print("\(name): \(location.coordinate.latitude),\(location.coordinate.longitude)")
                    
                    let sydneyCenter = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    
                
                    let region = MKCoordinateRegion.init(
                        center: sydneyCenter.coordinate, latitudinalMeters: 50, longitudinalMeters: 50)
                    self.mapview.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
                    let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: self.mapDistance)
                    self.mapview.setCameraZoomRange(zoomRange, animated: true)
                    
                    let coords = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    let address = [CNPostalAddressStreetKey: name]
                    let place = MKPlacemark(coordinate: coords, addressDictionary: address as [String : Any])
                    self.mapview.addAnnotation(place)
                }
            }
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
}
