//
//  MapViewModel.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-16.
//

import Foundation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 49.277748, longitude: -122.909050)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
}
// This function returns the user's location
final class MapViewModel: NSObject,ObservableObject, CLLocationManagerDelegate{
    
    override init() {} // This initializer won't affect anything
        //  longitudeDelta - height, latitudeDelta - width. and these values control how zoomed in the map will be. THe smaller the value, the more zoomed in the map will be. 
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    // We change the property wrapper to published so that when the data changes, we update the UI
    
    var locationManager:CLLocationManager? // Optional since the location could be turned off.
    
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self // Force unwrap, bad idea in most cases because app will crash. Should be fine here though.
            
        }
        else{
            print("Location services are turned off")
        }
    }
    // This function checks to see whether the user has authenticated their location data to be used by this app/ their device in general
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location information is restricted")
        case .denied:
            print("You have denied this app permission to access your location. Please go to settings to change it. ")
        case .authorizedWhenInUse,.authorizedAlways:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)) // During this case, the user's location will be used to change the data on the region variable.
        @unknown default:
            break
        }
    }
    
    //By making the class conform to the CLLocationManagerDelegate, we get access to all the methods that the class has.
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    // Random addresses. 
    private (set) var data:[Location] = [
        // Is there a way to use a network call to get this data instead of typing it out here this way?
        
        Location(house_number: 25, street_name: "Howard", city_name: "Burnaby", province: "BC", postalCode: "V5B3Y1", country: "Canada", coordinates: .init(latitude: 77, longitude: 35)),
        Location(house_number: 647, street_name: "Homer", city_name: "Vancouver", province: "BC", postalCode: "V5A54T", country: "Canada", coordinates: .init(latitude: 76, longitude: 88)),
        Location(house_number: 4677, street_name: "Fell", city_name: "Coquitlam", province: "BC", postalCode: "V3C777", country: "Canada", coordinates: .init(latitude: 43, longitude: 56)),
        Location(house_number: 656, street_name: "Lowe", city_name: "North Vancouver", province: "BC", postalCode: "V56782", country: "Canada", coordinates: .init(latitude: 97, longitude: 122)),
        Location(house_number: 663, street_name: "Joyner", city_name: "Jersey", province: "BC", postalCode: "V65HH4", country: "Canada", coordinates: .init(latitude: 34, longitude: 55)),
        Location(house_number: 799, street_name: "Hamilton", city_name: "Ohio", province: "OH", postalCode: "V65H7Y", country: "USA", coordinates: .init(latitude: 45, longitude: 36))
        
    ]
    
    // We could have a property called address that is a string containing the entire
    
    @Published var possibleSearchResults = [Location]()
    
    func search(with query: String = ""){
        
        possibleSearchResults = query.isEmpty ? data : data.filter{$0.street_name.contains(query)}
        
    }
}




