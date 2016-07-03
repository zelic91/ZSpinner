Pod::Spec.new do |s|
  s.name             = 'ZSpinner'
  s.version          = '0.1.0'
  s.summary          = 'An interesting activity indicator for iOS.'

  s.description      = <<-DESC
Default UIActivityIndicator is boring. That's why ZSpinner comes to make the world a better place.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/ZSpinner'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thuong Nguyen' => 'thuongnh.uit@gmail.com' }
  s.source           = { :git => 'https://github.com/zelic91/ZSpinner.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZSpinner/Classes/**/*'
end
