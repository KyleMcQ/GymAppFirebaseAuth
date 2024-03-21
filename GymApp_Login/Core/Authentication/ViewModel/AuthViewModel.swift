//
//  AuthViewModel.swift
//  GymApp_Login
//
//  Created by Kyle on 20/03/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var userWorkouts: [Workout] = []
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch{
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
    
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname,email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch{
            print("DEBUG: Failed to create user with \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut() // Sings out user on backend
            self.userSession = nil // wipes out user session and takes us back to login
            self.currentUser = nil // Wipes out current user data model
        }
        catch{
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        
        
    }
    // Adds a new workout to Firestore
    func addWorkout(exercise: String, reps: Int, weight: Double) {
        guard let userID = self.userSession?.uid else { return }
           
        let workout = Workout(userID: userID, exercise: exercise, reps: reps, weight: weight)
        do {
            let _ = try Firestore.firestore().collection("workouts").addDocument(from: workout)
        } catch {
               print("DEBUG: Failed to add workout with error \(error.localizedDescription)")
           }
       }
    
    func fetchWorkouts() async {
        guard let userID = self.userSession?.uid else { return }

        let workoutsCollection = Firestore.firestore().collection("workouts")
        do {
            let snapshot = try await workoutsCollection.whereField("userID", isEqualTo: userID).getDocuments()
            self.userWorkouts = snapshot.documents.compactMap { document in
                try? document.data(as: Workout.self)
            }
        } catch {
            print("DEBUG: Failed to fetch workouts with error \(error.localizedDescription)")
        }
    }
    
}
