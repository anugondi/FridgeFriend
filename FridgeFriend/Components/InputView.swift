//
//  InputView.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/7/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String // allows user to store, change, & view data
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.custom("Avenir Black", size: 18.0))
                .font(.footnote)
            if isSecureField{ //creates pass if true
                SecureField(placeholder, text: $text)
                    .font(.custom("Avenir Black", size: 14.0))
            } else {
                TextField(placeholder, text: $text)
                    .font(.custom("Avenir Black", size: 14.0))
            }
            
            Divider()
        }
    }
}
 
struct InputView_Previews: PreviewProvider{
    static var previews: some View{
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
