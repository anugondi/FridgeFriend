//
//  LoginView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

import SwiftUI



extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
        
    var body: some View {
        
        //Spacer()
        
        NavigationStack{
            VStack{ // vertically stacks all of the components
                //image
                Image("FF-logo")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .frame(maxHeight: 150)
                    .padding(.vertical, 32)
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    .fontWeight(.semibold)
                    
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in button
                // GO BACK AND FIGURE OUT HOW TO LINK SIGN IN BUTTON TO PROFILE VIEW USING FIREBASE AUTHENTICATION
                //Button {
//                    Task{
//                        //try await viewModel.signIn(withEmail:email, password:password)
//                    }
                //}
                NavigationLink {
                    MainTabView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .font(.custom("Avenir Black", size: 18.0))
                    }
                    .foregroundColor(Color(hex: 0xffffff))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(hex: 0x475fa7))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0: 0.5)
                .cornerRadius(10.0)
                .padding(.top, 24)
                      
                
                
                
                
                Spacer() //moves everything upwards
                
                //sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.custom("Avenir Medium", size: 18.0))
                    .foregroundColor(Color(hex: 0x62a464))
                }
                
            }
        }
    }
}


// MARK --> AUTHENTICATION OPACITY Protocol --> AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
