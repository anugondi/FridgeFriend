//
//  AuthViewModel.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

//making all network calls to Firebase
//Incharge of updates and notifications to UI.
import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift


protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject{
//class AuthViewModel{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init(){
        Task {
            try await loadUserData()
        }
        
    }
    
    @MainActor
    func signIn(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            //await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
//    func signIn(withEmail email: String, password: String) asynch throws{
//        do {
//            if (email == "test@gmail.com" && password == "123456") {
//                
//            }
//        }
//    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        print("Create user")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Did create user")
            await uploadUserData(uid: result.user.uid, fullname: fullname, email: email)
//            let user = User(id: result.user.uid, fullname: fullname, email: email)
//            let encodedUser = try Firestore.Encoder().encode(user)
//            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
//            await fetchUser()
            print("Uploaded data")
            ProfileView();
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error  \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as : User.self)
    }
    
    func uploadUserData(uid: String, fullname: String, email: String) async {
        let user = User(id: uid, fullname: fullname, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
        print("Snapshot data")
    }
}

