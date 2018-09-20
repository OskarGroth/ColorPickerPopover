//
//  OGColorWell.swift
//  ColorPicker
//
//  Created by Oskar Groth on 2016-08-31.
//  Copyright © 2016 Cindori. All rights reserved.
//

import Cocoa

@objc public protocol ColorWellDelegate {
    func colorWell(_ colorWell: ColorWell, didChangeColor color: NSColor)
}

open class ColorWell: NSColorWell, NSPopoverDelegate {
    
    @IBOutlet open var delegate: ColorWellDelegate?
    
    override open var isEnabled: Bool {
        didSet {
            alphaValue = isEnabled ? 1 : 0.5
        }
    }
    
    let viewController = ColorPickerViewController()
    
    override open func activate(_ exclusive: Bool) {
        viewController.loadView()
        viewController.colorPanel.color = color
        presentInPopover()
        viewController.colorPanel.addObserver(self, forKeyPath: "color", options: .new, context: nil)
    }
    
    open func presentInPopover() {
        let popover = NSPopover()
        popover.delegate = self
        popover.behavior = .semitransient
        popover.contentViewController = viewController
        popover.show(relativeTo: frame, of: self.superview!, preferredEdge: .maxX)
    }
    
    open func popoverDidClose(_ notification: Notification) {
        deactivate()
        viewController.colorPanel.removeObserver(self, forKeyPath: "color")
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "color":
            guard
                let panel = object as? NSColorPanel,
                panel == viewController.colorPanel
                else { return }
            color = viewController.colorPanel.color
            delegate?.colorWell(self, didChangeColor: color)
        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
}
