//
//  ExcercisePickerView.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//

import SwiftUI

struct ExercisePickerView: View {
    @Binding var selectedExercise: String
    let exercises: [String]
    
    var body: some View {
        Picker("Exercise", selection: $selectedExercise) {
            ForEach(exercises, id: \.self) { exercise in
                Text(exercise).tag(exercise)
            }
        }
        .pickerStyle(WheelPickerStyle())
    }
}
#Preview {
    ExercisePickerView(selectedExercise: .constant("Bench Press"), exercises: ["Bench Press", "Bicep Curls", "Deadlift", "Squats", "Shoulder Press"])
}
