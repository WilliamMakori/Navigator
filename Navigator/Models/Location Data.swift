//
//  SeachItems.swift
//  Navigator
//
//  Created by William Chacha on 2023-04-03.
//

import Foundation
import MapKit
// Observeable objects have data that can be accessed in the entire app
// The published properties can be called on any instance of the class when it is being used in another file
// Read up on the MVVM - model, views, and view models architecture again

class Locations: ObservableObject{
    
    @Published var locations:[Location] // this is the only property here
    
    init (){
        locations = [Location]() // To initialize it we assign it to an empty address array.
    }
    func getData(){
        // The code to perform the network call is written in here and returns an object that has all the data for the locations.
        
    }
}

// We don't need to use a services file to do this, we can handle it all in here.
/* For now we can
 - Create some mock JSON data
 - Save the JSON file locally in this project
 - Use the JSON parser to get the data into the app.
 Done.
 
*/
//Perform network calls to fetch the data for all the locations

struct Location:Identifiable {
    
    var id = UUID() // The JSON data won't have this field initialized
    var house_number:Int!
    var street_name:String!
    var city_name: String!
    var province: String!
    var postalCode: String!
    var country: String!
    // var coordinates: CLLocationCoordinate2D! Include this when fetching from the API.
    
    
}
