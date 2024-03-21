//
//  HomeView.swift
//  GymApp_Login
//
//  Created by Kyle on 20/03/2024.
//

import SwiftUI

struct HomeView: View {
    let username: String = "Shane McQuillan"
    
    // State variables for navigation
    @State private var shouldNavigateToAddWorkout = false
    @State private var shouldNavigateToViewWorkout = false
    @State private var shouldNavigateToProfile = false

    var body: some View {
        NavigationStack {
            List {
                Section("Workouts") {
                    // Button for adding a workout
                    Button {
                        shouldNavigateToAddWorkout = true
                    } label: {
                        WorkoutRowView(imageName: "plus.circle.fill", title: "Add Workout", tintColor: .blue)
                    }
                    .listRowBackground(Color.white)
                    
                    // Button for viewing workouts
                    Button {
                        shouldNavigateToViewWorkout = true
                    } label: {
                        WorkoutRowView(imageName: "eye", title: "View Workout", tintColor: .blue)
                    }
                    .listRowBackground(Color.white)
                }
                
                Section("Settings") {
                    // Button for settings
                    Button {
                        shouldNavigateToProfile = true
                    } label: {
                        WorkoutRowView(imageName: "gear", title: "Settings", tintColor: Color.gray)
                    }
                    .listRowBackground(Color.white) 
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text(username)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            // Hidden navigation links that are activated by the buttons
            .background(
                NavigationLink(destination: AddWorkoutView(), isActive: $shouldNavigateToAddWorkout) { EmptyView() }.hidden()
            )
            .background(
                NavigationLink(destination: ViewWorkoutView(), isActive: $shouldNavigateToViewWorkout) { EmptyView() }.hidden()
            )
            .background(
                NavigationLink(destination: ProfileView(), isActive: $shouldNavigateToProfile) { EmptyView() }.hidden()
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
