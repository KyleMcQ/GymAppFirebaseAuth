//
//  AddWorkoutView.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//

import SwiftUI

struct AddWorkoutView: View {
    @State private var selectedExercise: String = "Bench Press"
    @State private var reps: String = ""
    @State private var weight: String = ""
    @State private var workoutDate: Date = Date()
    @EnvironmentObject var viewModel: AuthViewModel
    
    let exercises = ["Bench Press", "Bicep Curls", "Deadlift", "Squats", "Shoulder Press"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Workout")) {
                    ExercisePickerView(selectedExercise: $selectedExercise, exercises: exercises)
                    
                    RepsAndWeightInputView(reps: $reps, weight: $weight)
                    
                    DatePicker("Workout Date", selection: $workoutDate, displayedComponents: .date)
                }
                
                Button("Save Workout") {
                    saveWorkout()
                }
                .disabled(!isFormValid())
            }
            .navigationBarTitle("Add Workout", displayMode: .inline) 
        }
    }
    
    private func saveWorkout() {
        let repsInt = Int(reps) ?? 0
        let weightDouble = Double(weight) ?? 0.0
        
        viewModel.addWorkout(exercise: selectedExercise, reps: repsInt, weight: weightDouble, date: workoutDate)
    }
    
    private func isFormValid() -> Bool {
        return !selectedExercise.isEmpty && !reps.isEmpty && !weight.isEmpty
    }
}
#Preview {
    AddWorkoutView()
}
