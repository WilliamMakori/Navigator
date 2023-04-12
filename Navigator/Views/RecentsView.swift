//
//  RecentsView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI
class CircleDimensions{
    var width: CGFloat
    var height: CGFloat
    init(number: CGFloat){
        width = number
        height = number
    }
    
}
struct RecentsView: View {
    var dimensions: CircleDimensions = CircleDimensions(number: 60)
    var body: some View {
        NavigationView{
            // Do you have to embed a list in a navigationView?
            
            List{
                HStack{
                    Circle()
                        .frame(width: dimensions.width, height: dimensions.width)
                        .foregroundColor(.red)
                        .overlay{
                            Image(systemName: "mappin")
                                .foregroundColor(.white)
                        }
                }
                HStack{
                    Circle()
                        .frame(width: dimensions.width, height: dimensions.width)
                        .foregroundColor(.red)
                        .overlay{
                            Image(systemName: "mappin")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                }
                HStack{
                    Circle()
                        .frame(width: dimensions.width, height: dimensions.width)
                        .overlay{
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                }
            }.navigationTitle("Recents")
        }
    }
}

struct RecentsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentsView()
    }
}
