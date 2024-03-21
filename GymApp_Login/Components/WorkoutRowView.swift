//
//  WorkoutRowView.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//
import SwiftUI

struct WorkoutRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: imageName)
                .imageScale(.large)
                .font(.title2)
                .foregroundColor(tintColor)
                .padding(8)
                .background(tintColor.opacity(0.2))
                .clipShape(Circle())
                
            Text(title)
                .fontWeight(.semibold)
                .font(.body)
                .foregroundColor(.primary)
                
            Spacer()
        }
        .padding(.vertical, 8)

        .cornerRadius(10)
        .shadow(radius: 2) 
    }
}

struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            WorkoutRowView(imageName: "gear", title: "Settings", tintColor: Color.blue)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

