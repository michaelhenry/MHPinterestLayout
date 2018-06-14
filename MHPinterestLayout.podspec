#
# Be sure to run `pod lib lint MHPinterestLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MHPinterestLayout'
  s.version          = ENV["MHPINTEREST_LAYOUT_VERSION"] || "1.0.0"
  s.summary          = 'Dynamic Pinterest CollectionView Layout'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Dynamic Pinterest CollectionView Layout
                       DESC

  s.homepage         = 'https://github.com/michaelhenry/MHPinterestLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Henry Pantaleon' => 'me@iamkel.net' }
  s.source           = { :git => 'https://github.com/michaelhenry/MHPinterestLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MHPinterestLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MHPinterestLayout' => ['MHPinterestLayout/Assets/*.png']
  # }
end
