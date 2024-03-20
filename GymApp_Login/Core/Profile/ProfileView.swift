//
//  ProfileView.swift
//  GymApp_Login
//
//  Created by Kyle on 20/03/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack{
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 4){
                    
                        Text(User.MOCK_USER.fullname)
                            .fontWeight(.semibold)
                            .padding(.top,4)
                        
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                    }
                }
            }
            
            Section("General"){
                HStack{
                    SettingsRowView(imageName: "gear",
                                    title: "version",
                                    tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Section("Account"){
                Button{
                    print("Sign out..")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                Button{
                    print("Delete out..")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
