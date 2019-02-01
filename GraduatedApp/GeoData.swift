//
//  GeoData.swift
//  GraduatedApp
//
//  Created by Miloš Čampar on 6/19/18.
//  Copyright © 2018 Miloš Čampar. All rights reserved.
//

import UIKit

class GeoData {
    
    var longitude = 0.0
    var latitude = 0.0
    var title = ""
    var type = ""
    
    init(coordinatesDict: Dictionary<String, AnyObject>) {
        
        if let properties = coordinatesDict["properties"] as? Dictionary<String, AnyObject> {
            
            if let title = properties["title"] as? String {
                self.title = title
            }
            
            if let type = properties["type"] as? String {
                self.type = type
            }
            
        }
        
        if let geometry = coordinatesDict["geometry"] as? Dictionary<String, AnyObject> {
            
            if let coordinates = geometry["coordinates"] as? [Double] {
                
                self.longitude = coordinates[0]
                self.latitude = coordinates[1]
            }
            
        }
        
    }
    
    
    
    
    
    
    
}
