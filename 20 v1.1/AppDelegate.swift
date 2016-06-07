//
//  AppDelegate.swift
//  20 v1.1
//
//  Created by Austin on 26/05/2016.
//  Copyright © 2016 Austin & Robin Co. Ltd. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    
    var timer       = NSTimer()
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    
    @IBAction func enableClicked(sender: NSMenuItem) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1200.0, target: self, selector: "alert", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func alert() {
        let myPopup: NSAlert = NSAlert()
        myPopup.messageText = "Friendly Reminder"
        myPopup.informativeText = "Just a friendly reminder to ask you to please look away from the screen for 20 seconds."
        myPopup.alertStyle = NSAlertStyle.WarningAlertStyle
        myPopup.addButtonWithTitle("OK")
        let res = myPopup.runModal()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        statusItem.title = "20³"
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

