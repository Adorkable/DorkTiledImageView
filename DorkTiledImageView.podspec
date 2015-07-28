Pod::Spec.new do |s|

  s.name         = "DorkTiledImageView"
  s.version      = "0.1.2"
  s.summary      = "simple Tiled Image View for iOS"
  s.license      = 'MIT'

  s.homepage     = "https://github.com/Adorkable/DorkTiledImageView"

  s.author       = { "Ian Grossberg" => "yo.ian.g@gmail.com" }
  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/Adorkable/DorkTiledImageView.git", :tag => s.version.to_s }

  s.source_files = "DorkTiledImageView/*.swift"

  s.requires_arc = true
end
