//
//  BottomSheetView.swift
//  Navigator
//
//  Created by Makori Chacha on 2023-02-26.
//

import SwiftUI
import MapKit

struct Home:View {
    

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
                                // Checking the direction of the scroll
                                // scrolling upwards....
                                // using startLocation bcz translation will change when we drag up and down....
                                // Something i missed up here
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
    
    struct BottomSheet: View {
       
        @Binding var offset: CGFloat
        @State var query: String = ""
        var value : CGFloat
        var body : some View{
            NavigationView{
                VStack {
                    HStack{
                        // add the button that represents the users profile
                    }
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVStack(alignment: .leading, spacing: 15, content: {
                         // Favourites
                         // Recents
                            // My Guides
                            //Three buttons at the bottom that create different pop up views.
                            // Four buttons
                            //Share My Location - impements search feature
                            
                            Button("Share my location") {
                                // The code here should bring out the share pop up menu.
                                // I think this is built in, shouldn't be too difficult
                            }
                           .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.04)
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            
                            // Mark my location
                            Button("Share my location") {
                                // The code here should bring out the share pop up menu.
                                // I think this is built in, shouldn't be too difficult
                            }
                           .frame(width: UIScreen.main.bounds.width)
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .padding(.top)
                            
                            // Report an issue
                            
                            Button("Share my location"){
                                // The code here should bring out the share pop up menu.
                                // I think this is built in, shouldn't be too difficult
                            }
                            
                           .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.04)
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .padding(.top)
                            
                            // Terms and conditions
                            
                            Button {
                                // opens link in safari that shows the terms and conditions of the app
                            } label: {
                                Text("Terms and conditions >")
                                    .underline()
                            }

                        })
                        .padding()
                        .padding(.top)
                    }
                    
                }
            }
            .searchable(text: $query){
                // We can use a preview
            }
            
//            .background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
            .onChange(of: query) { newValue in
                // observeablObject.searchResults = observeableObject.searchResults.filter ({ location in
                // if location.house_number.contains(query)
                // This will be shown to 
//            })
                
                
            }
        }
    }
    
    
    

    struct BottomSheetView_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
struct BottomSheetMenu: View{
    var body: some View{
        Text("All the views in the menu below")
        Text("recents")
        Text("")
    }
}
