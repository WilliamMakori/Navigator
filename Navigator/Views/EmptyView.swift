//
//  EmptyView.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-22.
//

import SwiftUI

struct EmptyView: View {
    @Binding var query:String
    var body: some View {
        Text("Sorry we couldn't find \(query)")
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(query: .constant("sdhjfubs"))
    }
}
