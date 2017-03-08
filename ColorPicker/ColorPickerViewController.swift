//
//  ColorPickerViewController.swift
//  ColorPicker
//
//  Created by Oskar Groth on 2016-08-31.
//  Copyright © 2016 Cindori. All rights reserved.
//

import Cocoa

class ColorPickerViewController: NSViewController {
    
    var colorPanel: NSColorPanel?
    
    override func loadView() {
        
        if NSColorPanel.sharedColorPanelExists() && NSColorPanel.shared().isVisible {
            
            NSColorPanel.shared().orderOut(self)
            
        }
        
        colorPanel = NSColorPanel.shared()
        colorPanel?.showsAlpha = true
        let paletteItem = colorPanel?.toolbar?.items[0]
        _ = colorPanel?.perform(paletteItem?.action, with: paletteItem)
        self.view = colorPanel!.contentView!
        colorPanel!.contentView!.frame = NSMakeRect(0, 0, view.frame.width, view.frame.height)
        colorPanel!.contentView!.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
        
        if let swatch = locateColorSwatch() {
            
            swatch.perform(NSSelectorFromString("updateSwatch"))
            
        }
        
    }
    
    func locateColorSwatch() -> NSView? {
        
        func findSwatchInSubviews(v: NSView) -> NSView? {
            
            for subview in v.subviews {
                
                if subview.className == "NSColorSwatch" {
                    
                    return subview
                    
                } else if let foundView = findSwatchInSubviews(v: subview) {
                    
                    return foundView
                    
                }
                
            }
            
            return nil
            
        }
        
        return findSwatchInSubviews(v: self.view)
        
    }
    
}
