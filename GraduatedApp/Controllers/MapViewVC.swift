//
//  MapViewVC.swift
//  GraduatedApp
//
//  Created by Miloš Čampar on 6/18/18.
//  Copyright © 2018 Miloš Čampar. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire

class MapViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var titles = [String]()
    var geoDatas = [GeoData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadCategoryName {
            
        }
        
        
        
    }
    
    func downloadCategoryName (completed: @escaping DownloadComplete) {
        
//        let markerURL = URL(string: MAPVIEW_URL)!
        
        Alamofire.request(MAPVIEW_URL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let metadata = dict["metadata"] as? Dictionary<String, AnyObject> {
                    
                    if let title = metadata["title"] as? String {
                        
                        self.titles.append(title)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
        Alamofire.request(MAPVIEW_URL1).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let metadata = dict["metadata"] as? Dictionary<String, AnyObject> {
                    
                    if let title = metadata["title"] as? String {
                        
                        self.titles.append(title)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
        Alamofire.request(MAPVIEW_URL2).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let metadata = dict["metadata"] as? Dictionary<String, AnyObject> {
                    
                    if let title = metadata["title"] as? String {
                        
                        self.titles.append(title)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
        Alamofire.request(MAPVIEW_URL3).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let metadata = dict["metadata"] as? Dictionary<String, AnyObject> {
                    
                    if let title = metadata["title"] as? String {
                        
                        self.titles.append(title)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Connectivity.isConnectedToInternet {
//            print("Yes! internet is available.")
            
        } else {
//            print("Noooo! internet is not available.")
            createAlert(title: "Try again", message: "You're not connected to the internet!")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "geodatacell") as? GeoDataCell {
            
            cell.titleLabel.text = self.titles[indexPath.row]
            self.titles.sort()
            return cell
            
        } else {
            return GeoDataCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row \(indexPath.row)")

        if indexPath.row == 0 {
            mapView.clear()
            self.downloadMarkersData {
            }
        }
        if indexPath.row == 1 {
            mapView.clear()
            self.downloadMarkersData1 {
            }
        }
        if indexPath.row == 2 {
            mapView.clear()
            self.downloadMarkersData3 {
            }
        }
        if indexPath.row == 3 {
            mapView.clear()
            self.downloadMarkersData2 {
            }
        }
    }
    
    func downloadMarkersData (completed: @escaping DownloadComplete) {
        
        let markerURL = URL(string: MAPVIEW_URL)!
        
        Alamofire.request(markerURL).responseJSON { response in

            let result = response.result

            if let dict = result.value as? Dictionary<String, AnyObject> {

                if let features = dict["features"] as? [Dictionary<String, AnyObject>] {

                    for obj in features {

                        let jsonMarker = GeoData(coordinatesDict: obj)
                        self.geoDatas.append(jsonMarker)
                        print(jsonMarker.title)
                        print(jsonMarker.latitude)
                        print(jsonMarker.longitude)

                        let marker = GMSMarker()
                        
                        marker.position = CLLocationCoordinate2D(latitude: jsonMarker.latitude, longitude: jsonMarker.longitude)
                        marker.title = "\(jsonMarker.title)"
                        marker.snippet = "\(jsonMarker.type)"
                        marker.map = self.mapView
                    }
                    self.tableView.reloadData()
                }

            }
            completed()
        }
        
    }
    
    func downloadMarkersData1 (completed: @escaping DownloadComplete) {
        
        let markerURL = URL(string: MAPVIEW_URL1)!

        Alamofire.request(markerURL).responseJSON { response in
            
            let result = response.result

            if let dict = result.value as? Dictionary<String, AnyObject> {
        
                if let features = dict["features"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in features {
                        
                        let jsonMarker = GeoData(coordinatesDict: obj)
                        self.geoDatas.append(jsonMarker)
                        print(jsonMarker.title)
                        print(jsonMarker.latitude)
                        print(jsonMarker.longitude)

                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: jsonMarker.latitude, longitude: jsonMarker.longitude)
                        marker.title = "\(jsonMarker.title)"
                        marker.snippet = "\(jsonMarker.type)"
                        marker.map = self.mapView
                        marker.icon = GMSMarker.markerImage(with: UIColor.blue)
                        
                    }
                    self.tableView.reloadData()
                }
                
            }
            completed()
        }
        
    }
    
    func downloadMarkersData2 (completed: @escaping DownloadComplete) {
        
        let markerURL = URL(string: MAPVIEW_URL2)!
        
        Alamofire.request(markerURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let features = dict["features"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in features {
                        
                        let jsonMarker = GeoData(coordinatesDict: obj)
                        self.geoDatas.append(jsonMarker)
                        print(jsonMarker.title)
                        print(jsonMarker.latitude)
                        print(jsonMarker.longitude)
                        
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: jsonMarker.latitude, longitude: jsonMarker.longitude)
                        marker.title = "\(jsonMarker.title)"
                        marker.snippet = "\(jsonMarker.type)"
                        marker.map = self.mapView
                        marker.icon = GMSMarker.markerImage(with: UIColor.gray)
                    }
                    self.tableView.reloadData()
                }
                
            }
            completed()
        }
        
    }
    
    func downloadMarkersData3 (completed: @escaping DownloadComplete) {
        
        let markerURL = URL(string: MAPVIEW_URL3)!
        
        Alamofire.request(markerURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let features = dict["features"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in features {
                        
                        let jsonMarker = GeoData(coordinatesDict: obj)
                        self.geoDatas.append(jsonMarker)
                        print(jsonMarker.title)
                        print(jsonMarker.latitude)
                        print(jsonMarker.longitude)
                        
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: jsonMarker.latitude, longitude: jsonMarker.longitude)
                        marker.title = "\(jsonMarker.title)"
                        marker.snippet = "\(jsonMarker.type)"
                        marker.map = self.mapView
                        marker.icon = GMSMarker.markerImage(with: UIColor.green)
                    }
                    self.tableView.reloadData()
                }
                
            }
            completed()
        }
        
    }
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //check does internet connection appear
    class Connectivity {
        class var isConnectedToInternet:Bool {
            return NetworkReachabilityManager()!.isReachable
        }
    }
    
    
    
    
    
    
    
    


    

}
