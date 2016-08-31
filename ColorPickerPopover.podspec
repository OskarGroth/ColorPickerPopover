Pod::Spec.new do |s|

s.name              = 'ColorPickerPopover'
s.version           = '0.0.1'
s.summary           = 'Color Picker inside NSPopover'
s.homepage          = 'https://github.com/OskarGroth/ColorPickerPopover'
s.license           = {
:type => 'MIT',
:file => 'LICENSE'
}
s.author            = {
'Oskar Groth' => 'oskar@cindori.org'
}
s.source            = {
:git => 'https://github.com/OskarGroth/ColorPickerPopover.git',
:tag => s.version.to_s
}
s.platform     = :osx, '10.9'
s.source_files = 'ColorPicker/*.{swift}'
s.requires_arc = true
s.screenshot   = "https://s3.amazonaws.com/cindori/images/colorpicker.png"
s.social_media_url = "https://twitter.com/cindoriapps"

end
