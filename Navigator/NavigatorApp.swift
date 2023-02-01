//
//  NavigatorApp.swift
//  Navigator
//
//  Created by Makori Chacha on 2022-12-10.
//

import SwiftUI

@main // Why do we use this tag? Makes this file the main entry point of the app. 
struct NavigatorApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            Map_Viewer()
            
        }
        
    }
    
}


