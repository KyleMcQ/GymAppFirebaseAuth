//
//  ContentView.swift
//  GymApp_Login
//
//  Created by Kyle on 20/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                HomeView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
