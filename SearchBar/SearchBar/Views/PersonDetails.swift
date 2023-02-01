//
//  PersonDetails.swift
//  SearchBar
//
//  Created by Makori Chacha on 2023-01-27.
//

import SwiftUI


struct UserInfoView: View {
    @State private var name = ""
    @State private var password = ""
    @State private var dateOfBirth = ""
    @State private var placeOfBirth = ""
    @State private var motherMaidenName = ""

    var body: some View {

        VStack {
            Text("HEADING")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                
            TextField("Name", text: $name)
                .padding()
                   .background(Color.white)
                   .cornerRadius(20.0)
                   .border(Color.black, width: 2)
            SecureField("Password", text: $password)
                .padding()
                   .background(Color.white)
                   .cornerRadius(20.0)
                   .border(Color.black, width: 2)
            TextField("Date of Birth", text: $dateOfBirth)
                .padding()
                   .background(Color.white)
                   .cornerRadius(20.0)
                   .border(Color.black, width: 2)
            TextField("Place of Birth", text: $placeOfBirth)
                .padding()
                   .background(Color.white)
                   .cornerRadius(20.0)
                   .border(Color.black, width: 2)
            TextField("Mother's Maiden Name", text: $motherMaidenName)
                .padding()
                   .background(Color.white)
                   .cornerRadius(20.0)
                   .border(Color.black, width: 2)

        }.padding()

    }
   
//       var body: some View {
//           ZStack {
//               Color.blue.edgesIgnoringSafeArea(.all)
//               Text("Hello World")
//           }
//       }
   
}
struct PersonDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
