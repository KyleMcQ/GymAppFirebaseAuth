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
}
