//
//  AppDelegate.swift
//  ColorPicker
//
//  Created by Oskar Groth on 2016-08-31.
//  Copyright © 2016 Cindori. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, ColorWellDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var testView: ColorDemoTestView!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func colorDidChange(colorWell: ColorWell, color: NSColor) {
        testView.layer?.backgroundColor = color.cgColor
    }


}

