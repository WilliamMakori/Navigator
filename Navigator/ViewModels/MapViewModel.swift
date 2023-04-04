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
    private (set) var data:[Location] = [] // Use the MOCK json data here.
    
    
    // We could have a property called address that is a string containing the entire
    
    @Published var possibleSearchResults = [Location]()
    
    func search(with query: String = ""){
        
        possibleSearchResults = query.isEmpty ? data : data.filter{$0.street_name.contains(query)}
        
    }
}




