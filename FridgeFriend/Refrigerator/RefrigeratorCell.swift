//
//  RefrigeratorCell.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/23/24.
//

import SwiftUI

struct RefrigeratorCell: View {
    let post: Post
    
    var body: some View {
        HStack{
            if let user = post.user {
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Rectangle())
                    .cornerRadius(10.0)
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 20)

                VStack (alignment: .leading, spacing: 2) {
                    Text(post.itemName)
                        .font(.custom("Avenir Medium", size: 18.0))
                    let d = post.expiryDate.formatted(.dateTime.day().month().year())
                    Text("Expires: \(d)")
                        .font(.custom("Avenir Medium", size: 18.0))
                        .foregroundColor(Color(hex: 0xee6b6e))
                }
            }
            


        }
    }
}

struct RefrigeratorCell_Previews: PreviewProvider {
    static var previews: some View {
        RefrigeratorCell(post: Post.MOCK_POSTS[0])
    }
}
