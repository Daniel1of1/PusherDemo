//
//  ViewController.swift
//  PusherDemoApp
//
//  Created by Playground on 06/02/2016.
//  Copyright © 2016 Manythings. All rights reserved.
//

import UIKit
import Pusher

class ViewController: UIViewController, PTPusherDelegate {
    
    var client: PTPusher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let channelNameData = NSData(contentsOfFile: "/tmp/PUSHER_DEMO_KEY") else {
            //Error in UI?
            return
        }
        
        let channelName = String(data: channelNameData, encoding: NSUTF8StringEncoding)
        _ = try? NSFileManager.defaultManager().removeItemAtPath("/tmp/PUSHER_DEMO_KEY")

        client = PTPusher(key: "765ec374ae0a69f4ce44", delegate: self)
        client.connect()
        
        let channel = client.subscribeToChannelNamed(channelName)
        
        channel.bindToEventNamed("my_event") { event in
            let controller = UIAlertController(title: "Message From Pusher", message: "\(event.data)", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            controller.addAction(action)
            self.presentViewController(controller, animated: true, completion: nil)
        }
        
    }
    
    func pusher(pusher: PTPusher!, connectionDidConnect connection: PTPusherConnection!) {
        // print("yay")
    }
    
    func pusher(pusher: PTPusher!, connection: PTPusherConnection!, failedWithError error: NSError!) {
        print(error)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
