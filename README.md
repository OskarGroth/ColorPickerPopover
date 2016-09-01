ColorPickerPopover
==================

Lightweight Color Picker inside NSPopover.

<img src="https://s3.amazonaws.com/cindori/images/colorpicker.png" width="620">

This popover shows a single color picker option (defaulting to Color Wheel).

You can change the color picker by changing:

        let paletteItem = colorPanel?.toolbar?.items[0]
        
To other color palette item indexes.

If you want to show a true color panel (with the toolbar and all the options), it should be straightforward to implement the toolbar manually. If you do, please send me a pull request.

## Installation (CocoaPods)
Configure your Podfile to use `ColorPickerPopover`:

```pod 'ColorPickerPopover'```

Note that this repo is Swift 3 only.

## Usage

Create an `NSColorWell` in Interface Builder and set it's class to `ColorWell`.

Set its delegate to your view controller or other class.

Implement the delegate method:

    func colorDidChange(colorWell: ColorWell, color: NSColor)

## License
The MIT License (MIT)

Copyright (c) 2016 Oskar Groth

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
