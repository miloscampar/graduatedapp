//
//  Constants.swift
//  GraduatedApp
//
//  Created by Miloš Čampar on 6/18/18.
//  Copyright © 2018 Miloš Čampar. All rights reserved.
//

import Foundation

let MAPVIEW_URL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"
// all earthquakes in last hour

let MAPVIEW_URL1 = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson"
// all earthquakes more than 4.5M only yesterday

let MAPVIEW_URL2 = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
// all earthquakes more than 4.5M about last 7 daya

let MAPVIEW_URL3 = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.geojson"
// all earthquakes more than 4.5M about one month

typealias DownloadComplete = () -> ()
