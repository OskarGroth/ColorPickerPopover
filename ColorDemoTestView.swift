//
//  ColorDemoTestView.swift
//  ColorPicker
//
//  Created by Oskar Groth on 2016-08-31.
//  Copyright © 2016 Cindori. All rights reserved.
//

import Cocoa

class ColorDemoTestView: NSView {

    override func awakeFromNib() {
        super.awakeFromNib()
        wantsLayer = true
        layer?.cornerRadius = frame.size.width/2
        layer?.backgroundColor = NSColor.blue.cgColor
    }
    
}
