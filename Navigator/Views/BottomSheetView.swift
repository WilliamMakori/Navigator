//
//  BottomSheetView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI

struct BottomSheetView: View {
    // State variables also create a binding and they also store the value. 
//    @Binding var query:String // two way connection, the UI can change this and vice versa.
//    var locations:[Address] = [Address(nameOfLocation: "Makori's House", street_Number: 21, street_Name: "Fell Avenue", cityName: "Burnaby", postalCode: "V5B 3Y1", province: "BC"),
//                               Address(nameOfLocation: "PiDGiN Restaurant", street_Number: 350, street_Name: "Carrall", cityName: "Vancouver", postalCode: "V6B 2J3", province: "BC"),
//                               Address(nameOfLocation: "Bula Hookah Lounge", street_Number: 4027, street_Name: "Hastings", cityName: "Burnaby", postalCode: "V5C 2J1", province: "BC")
//    ]
    
    var body: some View {
       // Write code for the entire bottom sheet and include the other four views above it in it's window
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
//            TextField("Search Navigator", text: $query)
//                .background(BlurView(style: .light)) // Add a blurView as the background of the search bar.
//                .frame(width: UIScreen.main.bounds.width*0.8, height: 8, alignment: .center)
        }
    }
}
struct Address: Identifiable{
    let id:String = UUID().uuidString
    let nameOfLocation:String?// This should be an optional as not all places have names. eg: Bula Hookah Lounge.
    let street_Number: Int
    let street_Name: String
    let cityName: String
    let postalCode: String
    let province: String
    
}
struct BlurView:UIViewRepresentable{
    
    var style : UIBlurEffect.Style // This gives different alternative
    
    // This function is necessary to conform to UIViewRepresentable.
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
        
    }// This function is necessary to conform to UIViewRepresentable.
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
         // Just had to edit the placeholder, nothing gets returned here so there's no need for a return statement.
        
    }
}
struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
