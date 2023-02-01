//
//  SearchBarView.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-22.
//

import SwiftUI
// The objective of this file is to display the search bar.

struct SearchBarView: View {
    @State var query: String = ""
    @StateObject var viewModel = MapViewModel()
    
    var body: some View {
        
        NavigationView{
            List(viewModel.possibleSearchResults){ address in
                Text("\(address.house_number) \(address.street_name) \(address.city_name) \(address.province) ")
            }
            .navigationTitle("Enter your destination")
        }
    
        .searchable(text: $query)
            .onAppear{
                
                viewModel.search() // If we don't pass anything the entire list is shown
                
            }
            .onChange(of: query) { newValue in
                 
                viewModel.search(with: query)
                
            }
            .onTapGesture {
                viewModel.search()
            }
            .overlay{
                if viewModel.possibleSearchResults.isEmpty{
                EmptyView(query: $query)
                }
            }
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
