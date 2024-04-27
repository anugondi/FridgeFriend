//
//  ContentView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                LoginView()
            } else {
                LoginView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
