Pod::Spec.new do |s|
  s.name             = 'KVKToast'
  s.version          = '0.0.2'
  s.summary          = 'Toast for iOS.'
  s.homepage         = 'https://github.com/kvyatkovskys/KVKToast'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Sergei Kviatkovskii' => 'sergejkvyatkovskij@gmail.com' }
  s.source           = { :git => 'https://github.com/kvyatkovskys/KVKToast.git', :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/kvyatkovskys'
  s.ios.deployment_target = '10.0'
  s.source_files     = 'Sources/**/*.swift'
  s.swift_version    = '5.0'
end
