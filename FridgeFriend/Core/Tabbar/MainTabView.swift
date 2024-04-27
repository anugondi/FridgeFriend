//
//  MainTabView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/12/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    
    var body: some View {
        TabView(selection: $selectedIndex){
            
            
            RefrigeratorView(post: Post.MOCK_POSTS[0])
                .tabItem {
                    Label("Refrigerator",
                        systemImage: "cube")
                            }
                .onAppear{
                    selectedIndex = 0
                }.tag(0)
            UploadPostView(tabIndex: $selectedIndex)
                .tabItem {
                    Label("Upload",
                          systemImage: "plus")
                            }
                .onAppear{
                    selectedIndex = 1
                }.tag(1)
            
            CommunityView()
                .tabItem {
                    Label("Community",
                        systemImage: "heart")
                            }
                .onAppear{
                    selectedIndex = 2
                }.tag(2)
            
            //Text("Profile")
            ProfileView()
                .tabItem {
                    Label("Profile",
                        systemImage: "person")
                            }
                .onAppear{
                    selectedIndex = 3
                }
                .tag(3)
        }
        .accentColor(Color(hex: 0x475fa7))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View{
        MainTabView()
    }
}
