
Pod::Spec.new do |s|
  s.name         = "swift-minikit"
  s.version      = "1.0.3"
  s.swift_version ="4.0"
  s.summary      = "Swift 常用的一些工具或base类 封装成,组件化, miniKit."
  s.description  = <<-DESC
                  Swift 常用的一些工具或base类 封装成,组件化,方便新项目直接用,不用拖来拖去, miniKit.
                   DESC

  s.homepage     = "https://github.com/dongshangtong/swift-minikit"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "dongshangtong" => "dongshangtong@gmail.com" }

  s.platform     = :ios, "10.0"
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/dongshangtong/swift-minikit.git", :tag => "#{s.version}" }
  
  #s.source_files  = "minikit", "minikit/**/*"


   s.subspec 'MNBase' do |sb|
    sb.source_files  = 'minikit/MNBase/*.swift'
  end

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  s.requires_arc = true

  # s.dependency "JSONKit", "~> 1.4"

end
