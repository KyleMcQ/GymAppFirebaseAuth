//
//  GymApp_LoginApp.swift
//  GymApp_Login
//
//  Created by Kyle on 20/03/2024.
//

import SwiftUI
import Firebase

@main
struct GymApp_LoginApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
