//
//  ProfileView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

// Profile page 

import SwiftUI
import UserNotifications
import UserNotificationsUI


struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    let notificationManager = NotificationManager()
    
    @State private var showNotif = false
    @State private var showCam = false
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack{
                List{
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: 0x7474a0))
                                .frame(width: 72, height: 72)
                                .background(Color(hex: 0xe1ebfa))
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(user.fullname)
                                    //.font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                    .font(.custom("Avenir Medium", size: 20.0))
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .font(.custom("Avenir Light", size: 18.0))
                            }
                        }
                    }
                    Section("Notifications") {
                        VStack{
                            Toggle("Notify Expiration Alerts ", isOn: $showNotif)
                                .font(.custom("Avenir Medium", size: 16.0))
                                .onChange(of: showNotif) { newValue in
                                            if newValue {
                                                requestNotificationAuthorization()
                                            }
                                        }
//                                .onChange(of: showNotif) {
//                                    NotificationManager.requestPermission(notificationManager)
//                                }
                            Toggle("Enable Camera ", isOn: $showCam)
                                .font(.custom("Avenir Medium", size: 16.0))
                        }
                    }
                    Section("Account") {
                        VStack {
                                NavigationLink {
                                    LoginView()
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    HStack(spacing: 5) {
                                        
                                        Text("Sign out")
                                            .fontWeight(.semibold)
                                    }
                                    .font(.custom("Avenir Medium", size: 16.0))
                                    .foregroundColor(Color(hex: 0xC70039 ))
                                    
                            }
                        }
                    }
                }
            }
        }
    }
}
private func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All Set")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }


#Preview {
    ProfileView()
}

//struct ProfileView_Previews: PreviewProvider{
//    static var previews: some View {
//        ProfileView()
//    }
//}
