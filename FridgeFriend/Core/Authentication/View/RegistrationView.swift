//
//  RegistrationView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack{
            Image("FF-logo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .scaledToFill()
                .frame(maxHeight: 150)
                .padding(.vertical, 32)
            VStack(spacing: 24){
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "First Last")
                .autocapitalization(.none)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else{
                            Image(systemName: "mark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture(perform: {
                            dismiss()
                        })
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            
            
            NavigationStack(path: $path) {
                Button {
                    
                    Task{
                        try await viewModel.createUser(withEmail:email, password: password, fullname: fullname)
                    
                    }
                    dismiss()
                    
                } label: {
                    HStack {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .font(.custom("Avenir Black", size: 18.0))
                    }
                    .foregroundColor(Color(hex: 0xffffff))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(hex: 0x475fa7))
                .cornerRadius(10.0)
                .padding(.top, 24)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0: 0.5)
                .navigationDestination(for: String.self) {view in
                    if view == "Profile View" {
                        ProfileView()
                    }
                }
            }
            
            Spacer()
            
            Button{
                dismiss() //take you back to previous page called in LoginView

            } label: {
                HStack(spacing: 5) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.custom("Avenir Medium", size: 18.0))
                .foregroundColor(Color(hex: 0x62a464))
            }
        }
    }
}


extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
