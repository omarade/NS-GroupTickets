//
//  NsGroupTravelApp.swift
//  NsGroupTravel
//
//  Created by Omar on 22/10/2022.
//

import SwiftUI
import Firebase

@main
struct NsGroupTravelApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
