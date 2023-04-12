//
//  FavouritesView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI

struct Favourites: View{
    var heightAndWidthOfCircles: CGFloat =  70
    var body: some View{
        ScrollView(.horizontal){
            ZStack{
                RoundedRectangle(cornerSize: .zero)
                    .frame(width: UIScreen.main.bounds.width*0.90,height:UIScreen.main.bounds.height*0.16)
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                    .shadow(radius: 1)
                    .padding(.all)
                    
                VStack{
                    HStack(spacing: 17){
                        VStack{
                            Circle()
                                .foregroundColor(.blue)
                                .shadow(radius: 15)
                                .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                                .overlay {
                                    
                                    Image(systemName: "house.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                    
                                    
                                }
                            Text("Home")
                                .foregroundColor(.black)
                            Text("Close by")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                        
                        VStack{
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 15)
                                .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                                .overlay {
                                    
                                    Image(systemName:"briefcase.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                }
                            Text("Work")
                                .foregroundColor(.black)
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                        
                        VStack{
                            Circle()
                                .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                                .shadow(radius: 15)
                                .overlay {
                                    
                                    Image(systemName:"fork.knife")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                }
                                .foregroundColor(.orange)
                            Text("Msosi")
                                .foregroundColor(.black)
                            Text("Distance")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                        
                        VStack{
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 15)
                                .frame(width: heightAndWidthOfCircles, height:heightAndWidthOfCircles)
                                .overlay {
                                    
                                    Image(systemName: "plus")
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                }
                            Text("Add")
                                .foregroundColor(.black)
                            Text("Close by")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                        }
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
