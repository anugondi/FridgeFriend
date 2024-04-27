//
//  SurplusView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/27/24.
//

import SwiftUI

struct SurplusView: View {
    var body: some View {
        HStack{
            Text("Add Surplus Ingredient")
                .font(.custom("Avenir Medium", size: 18.0))
            //.frame(width: 100, height: 32)
                .foregroundColor(Color(hex: 0x475fa7))
                .cornerRadius(10.0)
            Image(systemName: "plus.circle")
                .foregroundColor(Color(hex: 0x475fa7))
        }
        
        ScrollView{
            VStack{
                VStack{
                    HStack {
                        VStack(alignment: .leading){
                            Text("I have extra eggs!                           ")
                                .font(.custom("Avenir Medium", size: 18.0))
                            
                            
                            Text("By: Anusha G")
                                .font(.custom("Avenir Medium", size: 14.0))
                                .foregroundColor(Color(hex: 0x475fa7))
                        }
                    }
                    
                    HStack{
                        Image("egg carton")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 200, height: 200)
                            .padding(.trailing, 20)
                    }.padding(.bottom, 15)
                    Text("Expires in 1 week.")
                        .font(.custom("Avenir Medium", size: 14.0))
                        .foregroundColor(.gray)
                    Text("Posted 1 day ago.")
                        .font(.custom("Avenir Medium", size: 14.0))
                        .foregroundColor(.gray)
                    NavigationLink{
                        MyRecipeView()
                    } label: {
                        Text("Claim Now")
                            .font(.custom("Avenir Medium", size: 14.0))
                        Image(systemName: "chevron.right")
                    }
                    Divider()
                    HStack {
                        VStack(alignment: .leading){
                            Text("Half dozen everything bagels          ")
                                .font(.custom("Avenir Medium", size: 18.0))
                            
                            
                            Text("By: Siya Y")
                                .font(.custom("Avenir Medium", size: 14.0))
                                .foregroundColor(Color(hex: 0x475fa7))
                        }
                    }
                    
                    HStack{
                        Image("everythingbagel")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 200, height: 200)
                            .padding(.trailing, 20)
                    }.padding(.bottom, 15)
                    Text("Expires in 2 weeks.")
                        .font(.custom("Avenir Medium", size: 14.0))
                        .foregroundColor(.gray)
                    Text("Posted 3 days ago.")
                        .font(.custom("Avenir Medium", size: 14.0))
                        .foregroundColor(.gray)
                    NavigationLink{
                        MyRecipeView()
                    } label: {
                        Text("Claim Now")
                            .font(.custom("Avenir Medium", size: 14.0))
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

#Preview {
    SurplusView()
}
