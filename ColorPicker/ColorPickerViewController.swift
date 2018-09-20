//
//  ColorPickerViewController.swift
//  ColorPicker
//
//  Created by Oskar Groth on 2016-08-31.
//  Copyright © 2016 Cindori. All rights reserved.
//

import Cocoa

class ColorPickerViewController: NSViewController {
    
    private(set) var colorPanel: NSColorPanel!
    
    override func loadView() {
        
        colorPanel = NSColorPanel.shared
        colorPanel.orderOut(self)
        colorPanel.showsAlpha = true
        colorPanel.mode = .wheel
        view = colorPanel.contentView!
        
    }
    
}
