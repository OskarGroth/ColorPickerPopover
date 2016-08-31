//
//  OGColorWell.swift
//  ColorPicker
//
//  Created by Oskar Groth on 2016-08-31.
//  Copyright © 2016 Cindori. All rights reserved.
//

import Cocoa

@objc public protocol ColorWellDelegate {
    func colorDidChange(colorWell: ColorWell, color: NSColor)
}

public class ColorWell: NSColorWell, NSPopoverDelegate {
    
    @IBOutlet public var delegate: AnyObject?
    
    let viewController = ColorPickerViewController()
    
    override public func activate(_ exclusive: Bool) {
        viewController.loadView()
        viewController.colorPanel?.color = color
        let popover = NSPopover()
        popover.delegate = self
        popover.behavior = .semitransient
        popover.contentViewController = viewController
        popover.show(relativeTo: frame, of: self.superview!, preferredEdge: .maxX)
        viewController.colorPanel!.addObserver(self, forKeyPath: "color", options: .new, context: nil)
    }
    
    public func popoverDidClose(_ notification: Notification) {
        deactivate()
        viewController.colorPanel?.removeObserver(self, forKeyPath: "color")
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let panel = object as? NSColorPanel {
            if panel == viewController.colorPanel {
                color = viewController.colorPanel!.color
                delegate?.colorDidChange(colorWell: self, color: color)
            }
        }
    }
    
}
