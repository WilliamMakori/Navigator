//
//  FavouritesView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI

struct Favourites: View{
    var heightAndWidthOfCircles: CGFloat =  80
    var body: some View{
        ScrollView(.horizontal){
            VStack{
                HStack{
                    
                    Text("  Favourites")
                        .foregroundColor(.gray)
                        .frame(alignment: .trailing)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                HStack{
                    VStack{
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                            .overlay {
                                
                                Image(systemName: "house.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    
                                
                            }
                        Text("Home")
                        Text("Close by")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    
                    VStack{
                        Circle()
                            .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                            .overlay {
                                
                                Image(systemName:"briefcase.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.accentColor)
                            }
                        Text("Work")
                        Text("Add")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    
                    VStack{
                        Circle()
                            .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                            .overlay {
                                
                                Image(systemName:"fork.knife")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                            .foregroundColor(.orange)
                        Text("Suggested")
                        Text("Distance to location")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    
                    VStack{
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                            .overlay {
                                
                                Image(systemName: "plus")
                                    .font(.largeTitle)
                                    .foregroundColor(.accentColor)
                            }
                        Text("Add")
                        Text("Close by")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                    }
                }
            }
            
        }
    }
}


struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        Favourites()
    }
}
