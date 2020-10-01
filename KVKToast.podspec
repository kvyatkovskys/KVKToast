Pod::Spec.new do |s|
  s.name             = 'KVKToast'
  s.version          = '0.1.0'
  s.summary          = 'A short description of KVKToast.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/kvyatkovskys/KVKToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kvyatkovskys' => 'sergejkvyatkovskij@gmail.com' }
  s.source           = { :git => 'https://github.com/kvyatkovskys/KVKToast.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'KVKToast/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KVKToast' => ['KVKToast/Assets/*.png']
  # }

  s.frameworks = 'UIKit'
  s.swift_version = '5.0'
end
