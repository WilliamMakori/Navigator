//
//  PeopleViewModel.swift
//  SearchBar
//
//  Created by Makori Chacha on 2022-12-22.
//

import Foundation
import SwiftUI

var names:[String] = ["Makori Chacha", "Jason Ndambala", "Aly Ramzan", "Junior Ruge", "Dennis Mwirabi", "Esther Mwaigomole", "Sunday Joshua", "Maximillian Yanda", "Duty Free", "Frank Lugalo"]
enum Gender{
    case male
    case female
}
struct Person: Identifiable{
    var id = UUID()
    var name:String // This should always be set to an optional type to prevent the app from crashing when we perform a network call and the data isn't returned.
    var gender: Any // doesn't matter
}


final class PeopleViewModel: ObservableObject {
    
    private(set) var data: [Person] = [
        Person(name: names[2], gender: Gender.male),
        Person(name: names[5], gender: Gender.male),
        Person(name: names[1], gender: Gender.male),
        Person(name: names[7], gender: Gender.male),
        Person(name: names[6], gender: Gender.male),
        Person(name: names[3], gender: Gender.male),
        Person(name: names[9], gender: Gender.male),
        Person(name: names[4], gender: Gender.male),
        Person(name: names[8], gender: Gender.male)
    ]
    @Published var filteredData = [Person]() // initially it's empty
    
    func search(with query: String = "") {
        filteredData = query.isEmpty ? data : data.filter{$0.name.contains(query)}
        
        // use this ternary operator to check if query is empty then
        
    }
    
    
}

