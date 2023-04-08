//
//  GuidelinesView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI

struct GuidelinesView: View {
    var body: some View {
        VStack {
            Text("My Guide")
                .foregroundColor(.gray)
                .font(.footnote)
            .bold()
        }
        Button {
            // Opens pop up guide view and gives user the option to add a new Guide
        } label: {
            Text("New Guide")
        }

    }
}

struct GuidelinesView_Previews: PreviewProvider {
    static var previews: some View {
        GuidelinesView()
    }
}
