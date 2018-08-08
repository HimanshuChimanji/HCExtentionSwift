#
# Be sure to run `pod lib lint HCExtentionSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HCExtentionSwift'
  s.version          = '0.1.0'
  s.summary          = 'This is collection of extensions in swift'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'HCExtentionSwift is a collection of extensions which will shown in attributed inspector once you will change the class of particular items in indentity inspector'
                       DESC

  s.homepage         = 'https://github.com/HimanshuChimanji/HCExtentionSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Himanshu Chimanji' => 'Himanshuchimanji9897@gmail.com' }
  s.source           = { :git => 'https://github.com/HimanshuChimanji/HCExtentionSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HCExtentionSwift/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'HCExtentionSwift' => ['HCExtentionSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
