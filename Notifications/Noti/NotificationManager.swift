//
//  NotificationManager.swift
//  Notifications
//
//  Created by 김현구 on 3/22/24.
//

import Foundation
import UIKit

class NotificationManager {
    static let sharedInstance = NotificationManager()
    private var badgeCount = 0
    
    private init() { }
    
    func showNotification(delayInterval: TimeInterval = 0.1) {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Title \(badgeCount)"
        content.body = "Body \(badgeCount)"
        content.threadIdentifier = "Grouping Id"
        //        content.userInfo = model.userInfo
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delayInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "Notification Id  \(badgeCount)", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                // error
            }
        }
        
        badgeCount += 1
        updateAppBadge(badgeCount)
    }
    
    func updateAppBadge(_ badgeCount: Int) {
        setAppBandgeCount(badgeCount)
    }
    
    func clearAppBadge() {
        setAppBandgeCount(0)
    }
    
    private func setAppBandgeCount(_ badgeCount: Int) {
        if #available(iOS 17.0, *) {
            UNUserNotificationCenter.current().setBadgeCount(badgeCount)
        } else {
            UIApplication.shared.applicationIconBadgeNumber = badgeCount
        }
    }
}
