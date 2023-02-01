//
//  EmptyView.swift
//  SearchBar
//
//  Created by Makori Chacha on 2022-12-22.
//

import Foundation
import SwiftUI

struct EmptyView: View{
    @Binding var query:String // Declared as a binding string in order to ensure that the changes are sustained between views
    
    var body: some View{
        
        Text("We couldn't find \(query)")
        
    }
}
struct EmptyViewPreview: PreviewProvider{
    static var previews: some View{
        EmptyView(query: .constant("MujoliWaPili"))
    }
}
