//
//  RecipeView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/27/24.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        HStack{
            Text("Add Recipe")
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
                        Image("BlueberryPie")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 75, height: 75)
                        .padding(.trailing, 20)
                        
                        VStack(alignment: .leading){
                            Text("Pie by me :o                           ")
                                .font(.custom("Avenir Medium", size: 18.0))
                            
                                
                            Text("By: Tanvi P")
                                .font(.custom("Avenir Medium", size: 14.0))
                                .foregroundColor(Color(hex: 0x475fa7))
                        }
                    }
                    Text("Ingredients: Blueberries, Lemon, Sugar, Pie Dough")
                        .font(.custom("Avenir Medium", size: 18.0))
                        .padding([.trailing, .leading], 50)
                        
                    HStack{
                        Image("BlueberryPie2")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 200, height: 200)
                            .padding(.trailing, 20)
                    }.padding(.bottom, 20)
                    HStack{
                        NavigationLink{
                            MyRecipeView()
                        } label: {
                            Text("View My Recipe")
                                .font(.custom("Avenir Medium", size: 14.0))
                            Image(systemName: "chevron.right")
                            
                        }
                    }
                }
                Divider()
                
                VStack{
                    HStack {
                        Image("Blueberrymuffin1")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 75, height: 75)
                        .padding(.trailing, 20)
                        VStack(alignment: .leading){
                            Text("I made homemade blueberry muffins <3")
                                .font(.custom("Avenir Medium", size: 18.0))
                                
                            Text("By: Anusha G")
                                .font(.custom("Avenir Medium", size: 14.0))
                                .foregroundColor(Color(hex: 0x475fa7))
                        }
                    }
                    Text("Ingredients: Blueberries, Oats, Butter, Flour, Sugar, Eggs, Vanilla")
                        .font(.custom("Avenir Medium", size: 18.0))
                        .padding([.trailing, .leading], 50)
                        
                    HStack{
                        Image("blueberrymuffin2")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 200, height: 200)
                            .padding(.trailing, 20)
                    }.padding(.bottom, 20)
                }
                Divider()
                VStack{
                    HStack {
                        Image("BLUEBERRYPANCAKES2")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 75, height: 75)
                        .padding(.trailing, 20)
                        VStack(alignment: .leading){
                            Text("Pancakes from scratch :)         ")
                                .font(.custom("Avenir Medium", size: 18.0))
                                
                            Text("By: Siya Y")
                                .font(.custom("Avenir Medium", size: 14.0))
                                .foregroundColor(Color(hex: 0x475fa7))
                        }
                    }
                    Text("Ingredients: Blueberries, Flour, Buttermilk, Baking Soda, Eggs")
                        .font(.custom("Avenir Medium", size: 18.0))
                        .padding([.trailing, .leading], 50)
                        
                    HStack{
                        Image("BLUEBERRYPANCAKE")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                            .cornerRadius(10.0)
                            .frame(width: 200, height: 200)
                            .padding(.trailing, 20)
                    }.padding(.bottom, 20)
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    RecipeView()
}
