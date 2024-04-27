//
//  UploadPostViewModel.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/22/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase


@MainActor
class UploadPostViewModel: ObservableObject{
    @Published var selectedImage: PhotosPickerItem?{
        didSet{
            Task {await loadImage(fromItem:selectedImage)}
        }
    }
    @Published var postImage:Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
//    static func uploadPost(expiryDate: Date, itemName: String, uiImage: UIImage) {
//            let post: Post
//            ImageUploader.uploadImage(image: uiImage)
//            let postId = UUID().uuidString
            
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            guard let expiryDate = dateFormatter.date(from: expiryDate) else {
//                print("Invalid date format")
//                return
//            }
            // Creating the post object and adding it to the posts array
            //let post_temp = Post(id: postId, itemName: itemName, expiryDate: expiryDate, imageUrl: "image\(postId)") // Simulated image URL
            //get URL from the image
            //once we get url, we pass that into the temporary post variable
            // add that to the array that holds the posts for the user
            // these posts will be displayed on the feed
//            Post.MOCK_POSTS.append(post_temp)
            
            // Optionally, you could also print or return the uploaded post
//            print("Post uploaded successfully:")
//        }
    
    func uploadPost(expiryDate: String, itemName: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: uid, itemName: itemName, expiryDate: Date(), imageUrl: imageUrl)
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        
        try await postRef.setData(encodedPost)
 }
}
