//
//  HistoryEvent.swift
//  HistoryMap
//
//  Created by Rumata on 8/7/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper


struct HistoryEvent {

  var identifier: String!
  var description: String!
  var latitude: Double!
  var longitude: Double!

  lazy var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(
    latitude: self.latitude,
    longitude: self.longitude
  )

}

extension HistoryEvent: Mappable {

  init?(_ map: Map) {
    if map.JSONDictionary["id"] == nil {
      return nil
    }
  }

  mutating func mapping(map: Map) {
    identifier    <- map["id"]
    description   <- map["description"]
    latitude      <- (map["latitude"])
    longitude     <- (map["longitude"])
  }

}