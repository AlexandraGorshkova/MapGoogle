//
//  NavigatorController.swift
//  Navigator
//
//  Created by Alexandra Gorshkova on 25/04/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import Alamofire
import SwiftyJSON

class NavigatorController: UIViewController,  GMSMapViewDelegate, CLLocationManagerDelegate {
    @IBAction func toGo(_ sender: UIBarButtonItem) {
        print("iiiii")
         drawPath(startLocation: coordinateStart, endLocation: coordinateFinish)
    }
    
    @IBAction func toGo2(_ sender: UIButton) {
        drawPath(startLocation: coordinateStart, endLocation: coordinateFinish)
    }
    
    @IBOutlet weak var mapView: GMSMapView!
    
    //
    let coordinateFinish = CLLocationCoordinate2D(latitude: 55.753831, longitude: 37.621411)
    let coordF = CLLocation(latitude: 55.753831, longitude: 37.621411)
    //втб арена
    let coordinateStart = CLLocationCoordinate2D(latitude: 55.7911, longitude: 37.5589)
    let coordS = CLLocation(latitude: 55.7911, longitude: 37.5589)
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureMap()

    }
    
    func configureMap() {
        // Создаём камеру с использованием координат и уровнем увеличения
        let camera = GMSCameraPosition.camera(withTarget: coordinateStart, zoom: 17)
        mapView.camera = camera
        addMarker()
    }
    
    //MARK: function for create a marker pin on map
    
    func addMarker() {
        let marker = GMSMarker(position: coordinateStart)
        // Получаем стандартное изображение маркера, перекрасив его в зелёный
        // Устанавливаем как изображение маркера
        marker.icon = GMSMarker.markerImage(with: .green)
        marker.map = mapView
        
    }
    
    func drawPath(startLocation: CLLocationCoordinate2D, endLocation: CLLocationCoordinate2D)
    {
        let origin = "\(coordS.coordinate.latitude),\(coordS.coordinate.longitude)"
        let destination = "\(coordF.coordinate.latitude),\(coordF.coordinate.longitude)"
        
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=AIzaSyCFEvF5dufFq3tv4nKmR6FIwwEdxIr9IB4"
        print(url)
        AF.request(url).responseJSON { response in
            
            guard let data = response.data else { return }
            do{
                let json = try JSON(data: data)
                let routes = json["routes"].arrayValue
            
                // print route using Polyline
                for route in routes
                {
                    let routeOverviewPolyline = route["overview_polyline"].dictionary
                    let points = routeOverviewPolyline?["points"]?.stringValue
                    let path = GMSPath.init(fromEncodedPath: points!)
                    let polyline = GMSPolyline.init(path: path)
                    polyline.strokeWidth = 4
                    polyline.strokeColor = UIColor.red
                    polyline.map = self.mapView//self.googleMaps
                }
            } catch{ print("error")}
            
        }
        
    }
}
