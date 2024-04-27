//
//  RefrigeratorView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/15/24.
//

import SwiftUI

struct RefrigeratorView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    let post: Post
    var body: some View {
        NavigationStack {
            ScrollView{
                //header
                VStack(spacing: 10){
                    Text("Refrigerator").font(.custom("Avenir Black", size: 20.0))
                    // filtering -> figure out later 
//                    HStack{
//                        Text("Dairy")
//                            .font(.custom("Avenir Light", size: 16.0))
//                        Text("Produce")
//                            .font(.custom("Avenir Light", size: 16.0))
//                        Text("Meat")
//                            .font(.custom("Avenir Light", size: 16.0))
//                        Text("Grain")
//                            .font(.custom("Avenir Light", size: 16.0))
//                        Text("Prepared Meals")
//                            .font(.custom("Avenir Light", size: 16.0))
//                    }
                    
                    //action button
                    NavigationLink {
                        UploadPostView(tabIndex: .constant(0))
                    } label: {
                        HStack(spacing: 5) {
                            Text("Add Item")
                        }
                        .font(.custom("Avenir Medium", size: 18.0))
                        //.foregroundColor(Color(hex: 0x475fa7))
                        .frame(width: 360, height: 32)
                        .foregroundColor(.white)
                        .background(Color(hex: 0x475fa7))
                        .cornerRadius(10.0)
//                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: 0x475fa7), lineWidth: 1))
                    }
                    
                    
                    Divider()
                    
                }
                
                // post grid view
//                VStack{
//                    
//                }
                LazyVGrid(columns: [GridItem(.flexible(), alignment: .leading)], spacing: 30){
                    //ForEach(0 ... 15, id: \.self){
                    ForEach(Post.MOCK_POSTS){ post in
                        RefrigeratorCell(post: post)

//                        index in
//                        Image("spinach")
//                            .resizable()
//                            .scaledToFill()
//                            .cornerRadius(10.0)
//                            .frame(width: 100, height: 100)
//                            //.frame(width: UIScreen.main.bounds.width - 20, height: 100) // Adjust width and height as needed
//                            .padding(.horizontal, 10) // Add horizontal padding
                    }.padding(.horizontal, 20)
                    
                }
            }.navigationTitle("Refrigerator")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Medium", size: 25.0))
                
        }
    }
}



struct RefrigeratorView_Previews: PreviewProvider{
    static var previews: some View{
        RefrigeratorView(post: Post.MOCK_POSTS[0])
    }
}
