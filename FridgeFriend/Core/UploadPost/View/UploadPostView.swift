//
//  UploadPostView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/22/24.
//

// Page to upload photos for refrigerator

import SwiftUI
import PhotosUI
import UserNotifications
import UserNotificationsUI

struct UploadPostView: View {
    @State private var productname = ""
    @State private var expiration = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            Text("Upload").font(.custom("Avenir Black", size: 20.0))
            HStack{
                Button{
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex=0
                }label:{
                    Text("Cancel")
                        .font(.custom("Avenir Black", size: 18.0))
                        .foregroundColor(Color(hex: 0xee6b6e))
                }
                
                Spacer()
                
                
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack{
                if let image = viewModel.postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:400, height:400)
                        .clipped()
                    
                }
                
            
            }
            
            VStack(spacing: 20){
                InputView(text: $productname,
                          title: "Item", placeholder: "Blueberries")
                .autocapitalization(.none)
                .fontWeight(.semibold)
                .font(.custom("Avenir Black", size: 20.0))
                
                
                
                InputView(text: $expiration,
                          title: "Expiration Date",
                          placeholder: "January 1st, 2001")
                .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button{
                Task{
                    try await viewModel.uploadPost(expiryDate: expiration, itemName: productname)
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex=0
                }
            } label: {
                Text("Upload")
                    .fontWeight(.semibold)
                    .font(.custom("Avenir Black", size: 20.0))
            }
            
            
            Button{
                Task{
                    scheduleNotificationsForPosts()
                }
            } label: {
                Text("Alert on Expiry")
                    .font(.custom("Avenir Light", size: 15.0))
            }
            
            
//            NavigationLink {
//                MainTabView()
//                    .navigationBarBackButtonHidden(true)
//            } label: {
//                HStack {
//                    Text("Upload")
//                        .fontWeight(.semibold)
//                        .font(.custom("Avenir Black", size: 18.0))
//                }
//                .foregroundColor(Color(hex: 0xffffff))
//                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
//            }
//            .background(Color(hex: 0x475fa7))
//            .cornerRadius(10.0)
//            .padding(.top, 24)
//            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
        
    }
        
}

struct UploadPostView_Previews: PreviewProvider{
    static var previews: some View{
        UploadPostView(tabIndex: .constant(0))
    }
}
