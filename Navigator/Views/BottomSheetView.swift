//
//  BottomSheetView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI
import MapKit

struct Home: View {
    

    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.27), latitudinalMeters: 10000, longitudinalMeters: 10000)
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Map(coordinateRegion: $region)
                .ignoresSafeArea(.all,edges: .all)
            
            GeometryReader { reader in
                
                VStack{
                    BottomSheet(offset: $offset, value: (-reader.frame(in: .global).height + 150 ))
                        .offset(y: reader.frame(in: .global).height - 150)
                    // adding gesture....
                        .offset(y: offset)
                        .gesture(
                            
                            DragGesture().onChanged({ (value) in
                            withAnimation{
                                if value.startLocation.y > reader.frame(in: .global).minX{
                                    if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150){
                                        offset = value.translation.height
                                    }
                                }
                                // Read up on gestures again
                                if value.startLocation.y > reader.frame(in: .global).minX{
                                    
                                    if value.translation.height > 0 && offset < 0{
                                        offset = (-reader.frame(in: .global).height +  150) + value.translation.height
                                    }
                                    
                                }
                            }
                            
                        }).onEnded({ (value) in
                            // Keyboard has to disappear after clicking out.
                            withAnimation {
                                // Checking and pulling the screen ...
                                if value.startLocation.y > reader.frame(in: .global).midX{
                                    if -value.translation.height > reader.frame(in: .global).midX{
                                        
                                        offset = (-reader.frame(in: .global).height + 150)
                                        
                                        return // Why did he use this ?
                                        
                                    }
                                    offset = 0
                                }
                                if value.startLocation.y < reader.frame(in: .global).midX{
                                    
                                    if value.translation.height < reader.frame(in: .global).midX{
                                        
                                        offset = (-reader.frame(in: .global).height + 150)
                                        
                                        return // Why did he use this ?
                                        
                                    }
                                    offset = 0
                                }
                                
                            }
                        })
                        )
                }
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
        })
        
        
    }
    
    
    
    
    

    
}
// Can we store views as classes that take in arguments that initialize their instances?

struct BottomSheet: View {
   
    @Binding var offset: CGFloat
    @State var query: String = ""
    var heightAndWidthOfCircles: CGFloat = 70
    var value : CGFloat
    var body : some View{
        // How do these containers affect the functionality and positioning of views elements inside them?
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack{
                    HStack {
                        Text("      Favourites")
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                        .bold()
                        Spacer()
                    }
                    
                    Favourites(heightAndWidthOfCircles: 70)
                    // Why can't I add a list in here? 

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
                            
                            
                            
                        }
                    }
                    ZStack{
                        
                        RoundedRectangle(cornerSize: .zero)
                            .frame(width: UIScreen.main.bounds.width/1.09, height: 50)
                            .cornerRadius(10)
                            .opacity(10)
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
        .searchable(text: $query){
            
        }
        
                  
        
        .onChange(of: query) { newValue in
            // observeablObject.searchResults = observeableObject.searchResults.filter ({ location in
            // if location.house_number.contains(query)
            // This will be shown to
            //            })
     
        }
        .cornerRadius(15)
        
            
        
        
    }
}
struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

