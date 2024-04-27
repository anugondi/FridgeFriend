//
//  Post.swift
//  FridgeFriend
//
//  Created by Anusha Gondi on 4/23/24.
//

import Foundation
import UserNotifications

let notificationManager = NotificationManager()
let setReminder = Date();

struct Post: Identifiable, Codable {
    let id: String
    let ownerUid: String
    let itemName: String
    let expiryDate: Date
    var user: User?
    let imageUrl: String
}

//notificationManager.requestPermission(completionHandler: <#T##(Bool, Error?) -> Void#>)

func scheduleNotificationsForPosts() {
    for post in Post.MOCK_POSTS {
        
        // Assuming d is a DateFormatter instance set up to format dates as per your requirement
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" // Example date format

        // Get the current date and format it
        let currentDateFormatted = dateFormatter.string(from: Date())

        // Assuming post.expiryDate is already a Date object
        let postExpiryDateFormatted = dateFormatter.string(from: post.expiryDate)
        
        if (currentDateFormatted == postExpiryDateFormatted) {
            scheduleNotification(for: post)
        }
        
        if (postExpiryDateFormatted == "04/26/2024") {
            scheduleNotification(for: post)
        }
    }
}


func scheduleNotification(for post: Post) {
    // Check if expiry date has already passed
    guard post.expiryDate > Date() else {
        return // Skip scheduling notification for expired posts
    }
    
    // Calculate time interval until expiry date
    let timeInterval = post.expiryDate.timeIntervalSinceNow
    
    // Create notification content
    let content = UNMutableNotificationContent()
    content.title = "Fridge Friend"
    content.body = "\(post.itemName) is expiring on \(post.expiryDate)."
    
    // Create trigger
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: true)
    
    // Schedule notification
    notificationManager.scheduleNotification(
        id: post.itemName,
        content: content,
        trigger: trigger
    )
}

//func scheduleNotification() {
//        let timeIntervalMinutes = 1
//        //let notificationManager = NotificationManager()
//         
//        // create notification content
//        let content = UNMutableNotificationContent()
//        content.title = "Fridge Friend"
//        content.body = "Example body"
//
//        // create trigger (will show notification 1 min before selected time)
//        let triggerDate = setReminder.addingTimeInterval(Double(-timeIntervalMinutes * 60))
//        let trigger = UNCalendarNotificationTrigger(
//            dateMatching: Calendar.current.dateComponents([.timeZone, .year, .month, .day, .hour, .minute], from: triggerDate),
//            repeats: false
//    )
//
//    notificationManager.scheduleNotification(
//            id: "Example id",
//            content: content,
//            trigger: trigger)
//}     

func scheduleNotification(id: String, content: UNNotificationContent, trigger: UNNotificationTrigger) {
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        notificationManager.notificationCenter.add(request)
}

extension Post{
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Spinach", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "spinach"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Tomato", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "tomato"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Ice Cream Sandwhich", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "icecream"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Blueberries", expiryDate: {
            let dateString = "4/26/2024"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            guard let date = dateFormatter.date(from: dateString) else {
                fatalError("Failed to convert expiry date string to Date object")
            }
            return date
        }(), user: User.MOCK_USER, imageUrl: "blueberries"),
        //.init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Gyoza", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "Gyoza"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Bread", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "bread"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Cheese", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "cheese"),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, itemName: "Chicken Nuggets", expiryDate: Date(), user: User.MOCK_USER, imageUrl: "chicken")
    ]
}
