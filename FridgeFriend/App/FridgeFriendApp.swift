//
//  FridgeFriendApp.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

import SwiftUI
import Firebase

@main
struct FridgeFriendApp: App {
    @StateObject var viewModel=AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
