//
//  Map.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-12.

import SwiftUI
import MapKit
import Foundation

struct Map_Viewer: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State var searchText:String = ""
    @State var position = CGFloat.zero
    @State var isDragging = false // I don't really need this, but it will keep track of the drag gesture.
    // Why are we using two different values? does the second one change when the UI is updated in the dragginggesture.

    var region: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 123.00, longitude: 23.00)
    
    //
    var body: some View {
        
       Text("Map")
        }
}
// Data handling is hard, rewrite the bottomSheet feature and embed all the extra views inside it.
// 
// 1. Favourites view
// 2. Recents view
// 3. My Guides view



struct Map_Previews: PreviewProvider {
    static var previews: some View {
       Map_Viewer()
       
    }
}
    


