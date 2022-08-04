//
//  ViewController.swift
//  googleMapsTestTask
//
//  Created by Vadim Zhuravlenko on 3.08.22.
//
import GoogleMaps
import Alamofire
import UIKit
import Foundation
import SwiftyJSON

class ViewController: UIViewController {
    
    let apiKey = "YOUR_API_KEY"
    let url = "https://fish-pits.krokam.by/api/rest/points/"
    var arrLat = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: 53.893009, longitude: 27.567444, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 53.893009, longitude: 27.567444)
        marker.title = "Minsk"
        marker.snippet = "Belarus"
        marker.map = mapView
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
//                print(data)
                let value = JSON(data)
                for index in 0...value.count-1 {
                    print("\(value[index]["point"])")
                    print(index)
                    }
                break
                
            case .failure(let error):
                print(error)
                    }
            }
        }
   
}
