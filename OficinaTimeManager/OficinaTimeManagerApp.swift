//
//  OficinaTimeManagerApp.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 11/10/2024.
//

import SwiftUI
import Firebase

@main
struct OficinaTimeManagerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
