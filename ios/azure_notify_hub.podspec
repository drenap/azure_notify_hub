#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint azure_notify_hub.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'azure_notify_hub'
  s.version          = '1.0.0'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Datamine' => 'andrew.napitupulu@dataminesoftware.com' }
#   s.source           = { :path => '.' }
  s.source           = { :git => "https://github.com/Azure/azure-notificationhubs-ios.git", :tag => "3.1.5" }
  s.source_files     = 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.dependency 'AzureNotificationHubs-iOS'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
