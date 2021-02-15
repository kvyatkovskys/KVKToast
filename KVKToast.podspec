Pod::Spec.new do |spec|
  spec.name         = "KVKToast"
  spec.version      = "0.1.0"
  spec.summary      = "A short description of KVKToast."
  spec.description  = <<-DESC
  TODO: Add long description of the pod here.
                   DESC

  spec.homepage     = "http://EXAMPLE/KVKToast"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "Apache License, Version 2.0", :file => "FILE_LICENSE" }
  spec.author             = { "kviatkovskii" => "sergejkvyatkovskij@gmail.com" }
  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"
  spec.watchos.deployment_target = "5.0"
  spec.tvos.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/kvyatkovskys/KVKToast.git", :tag => spec.version.to_s }
  spec.source_files  = "Sources/KVKToast/**/*.{swift}"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

end