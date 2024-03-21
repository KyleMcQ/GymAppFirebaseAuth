//
//  HomeView.swift
//  GymApp_Login
//
//  Created by Kyle on 20/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            NavigationLink{
                ProfileView()
            } label: {
                HStack(spacing: 3){
                    Text("Click Here to View ")
                    Text("User Settings")
                        .fontWeight(.bold)
                }
                .font(.system(size:14))
            }
        }
    }
}

#Preview {
    HomeView()
}
