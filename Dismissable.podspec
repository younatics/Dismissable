#
# Be sure to run `pod lib lint YNDropDownMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Dismissable'
  s.version          = '1.1.1'
  s.summary          = 'Magical way to pull to dismiss your modal view!'

  s.description      = <<-DESC
                        Magic will be happened when you use Dismissable!
                        DESC

  s.homepage         = 'https://github.com/younatics/Dismissable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Seungyoun Yi" => "younatics@gmail.com" }

  s.source           = { :git => 'https://github.com/younatics/Dismissable.git', :tag => s.version.to_s }
  s.source_files     = 'Dismissable/*.swift'

  s.ios.deployment_target = '9.0'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
