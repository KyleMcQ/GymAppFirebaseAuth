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
        HStack(spacing: 16) { // Increased spacing for better visual separation
            Image(systemName: imageName)
                .imageScale(.large) // Use a larger image scale for prominence
                .font(.title2) // Adjusted font size for better visual hierarchy
                .foregroundColor(tintColor)
                .padding(8) // Add padding to create a larger tap target and visual balance
                .background(tintColor.opacity(0.2)) // Add a subtle background to the icon
                .clipShape(Circle()) // Clip the background to a circle for a modern look
                
            Text(title)
                .fontWeight(.semibold) // Use a semi-bold font weight for the title for better legibility
                .font(.body) // Updated font size for better readability
                .foregroundColor(.primary) // Use the primary color to support dark mode
                
            Spacer() // Push everything to the left
        }
        .padding(.vertical, 8) // Add vertical padding to the entire row for better tap targets
        .background(Color(UIColor.secondarySystemBackground)) // Use a secondary background color to differentiate the row
        .cornerRadius(10) // Round the corners for a softer look
        .shadow(radius: 2) // Optional: add a subtle shadow for depth
    }
}

// Preview
struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRowView(imageName: "gear", title: "Settings", tintColor: Color.blue)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

