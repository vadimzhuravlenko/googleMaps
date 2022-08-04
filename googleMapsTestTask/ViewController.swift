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
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: 53.893009, longitude: 27.567444, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)
        
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                let empty = try? JSONDecoder().decode(Empty.self, from: response.data!)
                empty?.forEach({ element in
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: ((element.point?.lat)! )!, longitude: (element.point?.lng)!)
                    marker.map = mapView
                })
                
            case .failure(let error):
                print(error)
                    }
            }
        }
   
}
