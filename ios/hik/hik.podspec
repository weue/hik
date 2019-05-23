

Pod::Spec.new do |s|

 

  s.name         = "hik"
  s.version      = "0.0.1"
  s.summary      = "Handle some data."
  s.description  = <<-DESC
                    Handle the data.
                   DESC

  s.homepage     = "http://csdn.net/veryitman"
  s.license      = "MIT"
  s.author             = { "veryitman" => "362675035@qq.com" }
  s.source =  { :path => '.' }
  s.source_files  = "hik", "**/**/*.{h,m,mm,c}"
  s.exclude_files = "Source/Exclude"
  s.resources = 'hik/resources/storyboard/**','hik/resources/image/**','hik/resources/xib/**'
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  
  s.ios.vendored_libraries = 'lib/*.a'
  s.ios.vendored_frameworks = 'lib/*.framework'
  
  s.dependency 'farwolf.weex'
  s.dependency 'XMLReader'
  #s.dependency 'Vendor', '~> 0.0.1'


  s.frameworks = 'CoreGraphics','Foundation','UIKit','AudioToolbox','OpenAL','OpenGLES','VideoToolbox','CoreVideo','CoreMedia','GLKit'
   s.libraries = "bz2","c++","iconv","z"

end
