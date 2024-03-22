# Local Notifications
> Local Notifications 와 App Badge 사용에 필요한 코드만 정리한 저장소

<br>

## Image
<br>

![스크린샷 2024-03-22 오후 2 33 01](https://github.com/hgkim2024/LocalNotifications/assets/163487894/26339b36-22a7-4658-b3eb-c2080139e097)
<br>
<br>
![스크린샷 2024-03-22 오후 2 33 55](https://github.com/hgkim2024/LocalNotifications/assets/163487894/09e7b8da-0376-4541-b01f-5b23fc8fe2dd)

<br>

## AppDelegate - Notifications 설정
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    UNUserNotificationCenter.current().delegate = self
    self.requestNotificationPermission()
    return true
}

func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
) {
    if #available(iOS 14.0, *) {
        completionHandler([.list, .banner, .badge, .sound])
    } else {
        completionHandler([.alert, .badge, .sound])
    }
}

func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
) {
    // Notifications Click Event
}
```

<br>

## NotificationManager - show notification and set app badge
```swift
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
```
<br>

## Notification 권한이 있는데 Local Notification 과 App badge 가 나타나지 않을 때
- 아이폰 설정을 초기화 한다. 초기화 방법은 아래와 같다.
- 설정 → 일반 → 재설정 → 모든 설정 재설정
<br>
<img src="https://github.com/hgkim2024/LocalNotifications/assets/163487894/7403991e-d0d2-488a-b3e4-361b81477236" width="20%"></img>
<img src="https://github.com/hgkim2024/LocalNotifications/assets/163487894/0408421c-bc91-4199-87df-598366dfb720" width="20%"></img>
<img src="https://github.com/hgkim2024/LocalNotifications/assets/163487894/317945f2-1a7b-4199-924c-634b7b9cdff1" width="20%"></img>
<img src="https://github.com/hgkim2024/LocalNotifications/assets/163487894/b5476c01-ee53-4af9-9180-06674b3cea0d" width="20%"></img>




