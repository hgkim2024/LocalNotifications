//
//  ViewController.swift
//  Notifications
//
//  Created by 김현구 on 3/22/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showNotification: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickNotificationButton(_ sender: Any) {
        NotificationManager.sharedInstance.showNotification()
    }
    
}

