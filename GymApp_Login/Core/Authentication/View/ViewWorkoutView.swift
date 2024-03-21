//
//  ViewWorkoutView.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//

import SwiftUI

struct ViewWorkoutView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        List(viewModel.userWorkouts) { workout in
            VStack(alignment: .leading) {
                Text(workout.exercise)
                    .font(.headline)
                Text("Reps: \(workout.reps)")
                Text("Weight: \(workout.weight)")
                Text("Date: \(workout.date)")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchWorkouts()
            }
        }
    }
}
#Preview {
    ViewWorkoutView()
}
