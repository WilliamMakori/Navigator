//
//  RecentsView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI

struct RecentsView: View {
   
    var body: some View {
        List{
            Button {
                // Navigates to a location, direct this to another view.
            } label: {
                HStack{
                    Circle()
                        .foregroundColor(.red)
                        .frame(width:30, height:30)
                        .overlay{
                            Image(systemName: "mappin")
                                .foregroundColor(.white)
                                //.font(.footnote)
                        }
                    VStack{
                        Text("Dropped pin")
                        
                            .foregroundColor(.black)
                        // Print the address associated with where the pin is below it, font - footnote, color is gray
                        Text("Address info")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    
                }
            }

            Button{
                
            }label:{
                HStack{
                    Circle()
                        .foregroundColor(.red)
                        .frame(width:30, height:30)
                        .overlay{
                            Image(systemName: "mappin")
                                .foregroundColor(.white)
                                //.font(.footnote)
                        }
                    VStack {
                        Text("Home")
                            .foregroundColor(.black)
                        Text("Address info")
                            .foregroundColor(.gray)
                            .font(.footnote)
                        
                    }
                }
            
            }
          
            Button {
                // Shows the place you looked up last
            } label: {
                HStack{
                    Circle()
                        .foregroundColor(.black)
                        .frame(width:30, height:30)
                        .overlay{
                            Image(systemName: "arrow.turn.up.right")
                                .foregroundColor(.white)
                        
                        }
                    Text("Hepatica florist")
                        .foregroundColor(.black)
                    
                    }
            }

        }
    }
}

struct RecentsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentsView()
    }
}
