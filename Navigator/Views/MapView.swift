//
//  Map.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-12.

import SwiftUI
import MapKit
import Foundation

struct Map_Viewer: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State var searchText:String = ""
    @State var offset : CGFloat = 0
   
    var body: some View {
        
        // Shows user location when authorized to
        
        ZStack{
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            //.navigationTitle("Searchable example")
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
            // to read frame height, we could also use UIScreen.main.bounds.height. This is also a dynamic way to read the height.
            
            GeometryReader{ reader in
                
                VStack{
                    
                BottomSheet()
                        .offset(y: reader.frame(in: .local).height - 180)
                    // We created an instance of the bottomsheet and overlayed it on the map. We offset it so it would sit at the bottom.
                    // adding gesture
                     .offset(y:offset)
                    // What does this second modifier do?
                    // the argument passed needs to be a CGFLoat value - done
                    // This offsets by moving down the specified units
                    
                    //SwiftUI .gesture modifier?
                    
                     .gesture(DragGesture().onChanged({ (value) in // Why is this done this way?
                         withAnimation {
                             // Checking the direction of scroll
                             
                             if value.startLocation.y > reader.frame(in: .global).minX{
                                 offset = value.translation.height
                             }
                             if value.startLocation.y < reader.frame(in: .global).minX{
                                 offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                             }
                         }
                         
                     }).onEnded({ (value) in // Why is this value here? 
                         
                         withAnimation{
                             
                             // Checking and pulling up the screen.
                             
                             if value.startLocation.y < reader.frame(in: .global).midX{
                                 
                             }
                             if value.startLocation.y < reader.frame(in: .global).midX{
                                 
                             }
                         }
                         
                     })
                     )
                     
                }
            } // Why do we have to specify the
            .ignoresSafeArea(.all, edges: .bottom)
            
            
            }
            
            
        }
        
        }
       
            
    

struct BottomSheet : View{
    @State private var showingCredits = false
    @State var query: String = ""
    
    // What should I add to the code to make sure the bottom sheet doesn't disappear and it stops at the bottom of the screen.
    
    var body: some View{
        VStack{
            // The little grey bar on the top of the search panel
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 5)
                .padding(.top)
                .padding(.bottom,5)
            
            HStack(spacing: 15){
                
                // Magnifying glass symbol in the search bar.
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                
                TextField("Search place", text: $query)
                // Why would we use this?
            }
            
            .padding(.vertical,10)
            .padding(.horizontal)
            
            // BlurView.. this will be put in the background, what purpose does it serve?
            
            // For dark mode adoption...
            
            .background(BlurView(style: .systemMaterial))
            
            .cornerRadius(15)
            
            .padding()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                // Lazy stacks are used when there are performance issues.
                
                // They work like lists, lists have added functionality eg. Swipe to delete,
                
                LazyVStack(alignment: .leading, spacing: 15, content: {
                    
                    ForEach(1...15, id:\.self) { count in
                        
                        Text("Searched Place")
                        Divider()
                            .padding(.top,10)
                        // Divides all the elements in the loop into individual segments.
                        
                        
                        
                    }
                    
                })
                
            })
        
        }.background(.white)
    
}
}
// What does this do? Why did he use this?
// This is a wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy

struct BlurView:UIViewRepresentable{
    
    var style : UIBlurEffect.Style // This gives different alternative
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style)) //
        
        return view
        
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
         // Just had to edit the placeholder, nothing gets returned here so there's no need for a return statement.
        
    }
}
struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map_Viewer()
    }
}
    
//struct BottomSheetPreview: PreviewProvider{
//    static var previews: some View{
//        bottomSheet()
//    }
//}


