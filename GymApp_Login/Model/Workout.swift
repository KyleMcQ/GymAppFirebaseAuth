//
//  Workout.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//

import Foundation

struct Workout: Codable, Identifiable {
    var id: String = UUID().uuidString
    let userID: String
    let exercise: String
    let reps: Int
    let weight: Double
    let date: Date
    
    // Initialize with current date by default
    init(userID: String, exercise: String, reps: Int, weight: Double, date: Date = Date()) {
        self.userID = userID
        self.exercise = exercise
        self.reps = reps
        self.weight = weight
        self.date = date
    }
}
