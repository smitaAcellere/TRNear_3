# Uncomment this line to define a global platform for your project
platform :ios, ‘9.0’

target 'TRNear_Swift' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TRNear_Swift

  target 'TRNear_SwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TRNear_SwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

    pod 'FacebookCore'
    pod 'FacebookLogin'
    pod 'FacebookShare'
	
    pod 'Google/SignIn'

    pod 'AFNetworking', '~> 3.0'

    pod 'Firebase/Core'

    pod ‘JTAppleCalendar’

    pod 'TKKeyboardControl'

    pod 'SkyFloatingLabelTextField', '~> 1.0'
pod 'NVActivityIndicatorView', :git => 'https://github.com/ninjaprox/NVActivityIndicatorView.git', :branch => 'swift2.3'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

end
