//
//  SearchBar.swift
//  Navigator
//
//  Created by William Chacha on 2023-04-03.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @State private var searchTerm = " "
    
    var body: some View {
        Text("Map and then bottom sheet")
    }
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
