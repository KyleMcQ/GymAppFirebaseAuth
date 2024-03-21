//
//  AddWorkoutView.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//

import SwiftUI

struct AddWorkoutView: View {
    @State private var exercise: String = ""
    @State private var reps: String = ""
    @State private var weight: String = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Form {
            Section(header: Text("Add Workout")) {
                TextField("Exercise", text: $exercise)
                TextField("Reps", text: $reps)
                    .keyboardType(.numberPad)
                TextField("Weight", text: $weight)
                    .keyboardType(.decimalPad)
                
                Button("Save Workout") {
                    // Validation and conversion should be done here
                    let repsInt = Int(reps) ?? 0
                    let weightDouble = Double(weight) ?? 0.0
                    // Call view model to save the workout
                    viewModel.addWorkout(exercise: exercise, reps: repsInt, weight: weightDouble)
                }
            }
        }
    }
}
#Preview {
    AddWorkoutView()
}
