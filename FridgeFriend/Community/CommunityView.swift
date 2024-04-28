//
//  CommunityView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/27/24.
//

import SwiftUI
import SlidingTabView

struct CommunityView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            SlidingTabView(selection: $selectedIndex, tabs: ["Recipes", "Surplus"], animation: .easeInOut,
                           activeAccentColor: Color(hex: 0x475fa7), selectionBarColor: Color(hex: 0x475fa7))
                .font(.custom("Avenir Medium", size: 18.0))
            Spacer()
            if selectedIndex == 0 {
                RecipeView()
            } else if selectedIndex == 1 {
                SurplusView()
            }
            Spacer()
        }

    }
}


struct CommunityView_Previews: PreviewProvider{
    static var previews: some View{
        CommunityView()
    }
}
