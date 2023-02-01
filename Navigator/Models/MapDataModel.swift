//
//  MapDataModel.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-22.
//

import Foundation
import CoreLocation

struct Location:Identifiable {
    
    var id = UUID()
    var house_number:Int!
    var street_name:String!
    var city_name: String!
    var province: String!
    var postalCode: String!
    var country: String!
    var coordinates: CLLocationCoordinate2D!
    
}

