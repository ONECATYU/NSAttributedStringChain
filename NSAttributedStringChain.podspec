Pod::Spec.new do |spec|

  spec.name         = "NSAttributedStringChain"
  spec.version      = "0.0.1"
  spec.summary      = "链式生成NSAttributedString"
  spec.homepage     = "https://github.com/ONECATYU/NSAttributedStringChain"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "ONECATYU" => "786910875@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/ONECATYU/NSAttributedStringChain.git", :tag => spec.version.to_s }
  spec.source_files  = "NSAttributedStringChain", "NSAttributedStringChain/**/*.{h,m}"
  spec.framework  = "Foundation"
  spec.requires_arc = true

end
