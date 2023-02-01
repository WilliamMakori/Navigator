//
//  ContentView.swift
//  SearchBar
//
//  Created by Makori Chacha on 2022-12-22.
//

import SwiftUI

struct PersonView: View {
    
    @StateObject var viewModel = PeopleViewModel()
    @State var query: String = ""
    
    var body: some View {
        
        NavigationView{
            List(viewModel.filteredData){ item in
                    Text(item.name)
            }.navigationTitle("People")
                .searchable(text: $query,prompt: "Look for people"){
                    // Provide suggestion when the user taps the bar and types in a name that isn't in the list
                    
                    if viewModel.filteredData.isEmpty{
                        let randomName =  viewModel.data.randomElement()!.name
                        Text("Maybe you're trying to find \(randomName)?")
                            .searchCompletion(randomName)
                    }
                    
                }
                .onSubmit(of: .search){ // Need simulator to show this
                    viewModel.search(with: query)
                }
//            .onChange(of: query) { newValue in
//                viewModel.search(with: newValue)
//                // this will do what? when the query variable changes, it will update the value that the function is executing on
//            }
            .onAppear{
                viewModel.search()
            }
//            .overlay{
//                if viewModel.filteredData.isEmpty{
//                    EmptyView(query: $query)
//                }
//            }
            
        }
        }
            
    
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
