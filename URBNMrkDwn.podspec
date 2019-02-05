#
# Be sure to run `pod lib lint URBNMrkDwn.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'URBNMrkDwn'
  s.version          = '1.1'
  s.summary          = 'Swifty Markdown inspired by CocoaMarkdown.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC                       DESC

  s.homepage         = 'https://github.com/urbn/URBNMrkDwn'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'URBN Mobile Team' => 'mobileteam@urbn.com' }
  s.source           = { :git => 'https://github.com/urbn/URBNMrkDwn.git', :tag => s.version.to_s }

  s.tvos.deployment_target = '9.0'
  s.ios.deployment_target = '8.0'
  s.ios.framework = 'UIKit'
  s.requires_arc  = true
  s.swift_version = '4.2'

  s.source_files = 'URBNMrkDwn/Classes/**/*'

  s.dependency 'URBNcmark'

end
