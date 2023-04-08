//
//  EmptyView.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-22.
//

import SwiftUI

struct EmptyView: View {
    
    var body: some View {
        
            
            VStack{
                Spacer()
                Spacer()
                ZStack{
                    
                    RoundedRectangle(cornerSize: .zero)
                        .frame(width: UIScreen.main.bounds.width/1.09, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(.gray) // Change the shade of gray to a lighter gray and then boom you've got the color
                    
                    
                    
                    VStack{
                        
                        Text("Share my Location")
                            .foregroundColor(.white)
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.borderedProminent)
                            .onTapGesture {
                                // Changes the UI to another view.
                            }
                        
                        //Text("\(UIScreen.main.bounds.width/1.31)")
                        
                    }
                }
                ZStack{
                    
                    RoundedRectangle(cornerSize: .zero)
                        .frame(width: UIScreen.main.bounds.width/1.09, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(.gray) // Change the shade of gray to a lighter gray and then boom you've got the color
                    
                    
                    
                    VStack{
                        
                        Text("Mark My Location")
                            .foregroundColor(.white)
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.borderedProminent)
                            .onTapGesture {
                                // Changes the UI to another view.
                            }
                        
                        //Text("\(UIScreen.main.bounds.width/1.31)")
                        
                    }
                }
                ZStack{
                    RoundedRectangle(cornerSize: .zero)
                        .frame(width: UIScreen.main.bounds.width/1.09, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(.gray) // Change the shade of gray to a lighter gray and then boom you've got the color
                    
                    
                    
                    VStack{
                        
                        Text("Report an Issue")
                            .foregroundColor(.white)
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.borderedProminent)
                        
                            .onTapGesture {
                                // Changes the UI to another view.
                            }
                        
                        //Text("\(UIScreen.main.bounds.width/1.31)")
                        
                    }
                    
                }
                HStack{
                    
                    Text("     Terms & Conditions>")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            // This should send me to the terms and conditions link
                            
                        }
                    Spacer();Spacer();Spacer();Spacer();Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
            }
            
        
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

