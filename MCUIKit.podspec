Pod::Spec.new do |s|
  s.name         = "MCUIKit"
  s.version      = "0.0.1"
  s.summary      = "MCUIKit can provide uikit ... capatities"
  s.homepage     = "https://github.com/poholo/MCUIKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "littleplayer" => "mailjiancheng@163.com" }
  s.social_media_url   = "https://weibo.com/lp927"

  s.requires_arc = true

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/poholo/MCUIKit.git", :tag => "#{s.version}" }

  s.public_header_files = 'SDK/Base/*.h',
                          'SDK/Base/**/*.h',
                          'SDK/Categories/*.h',
                          'SDK/Categories/**/*.h',
                          'SDK/Controller/*.h',
                          'SDK/Vendor/*.h',
                          'SDK/Vendor/**/*.h',
                          'SDK/View/*.h',
                          'SDK/View/**/*.h'


  s.source_files = 'SDK/Base/*.{h,m,mm}',
                   'SDK/Base/**/*.{h,m,mm}',
                   'SDK/Categories/*.{h,m,mm}',
                   'SDK/Categories/**/*.{h,m,mm}',
                   'SDK/Controller/*.{h,m,mm}',
                   'SDK/Vendor/*.{h,m,mm}',
                   'SDK/Vendor/**/*.{h,m,mm}',
                   'SDK/View/*.{h,m,mm}',
                   'SDK/View/**/*.{h,m,mm}'

  s.xcconfig = {
       'VALID_ARCHS' => 'arm64 x86_64',
       'USER_HEADER_SEARCH_PATHS' => '${PROJECT_DIR}/Pods/**'
  }
  s.pod_target_xcconfig = {
        'VALID_ARCHS' => 'arm64 x86_64'
  }

  s.dependency 'MCBase'
  s.dependency 'MCStyle'
  s.dependency 'MJRefresh'
  s.dependency 'Masonry'
  s.dependency 'MBProgressHUD'
  s.dependency 'HMSegmentedControl'
  s.dependency 'SDWebImage'
  s.dependency 'MMPopupView'

  s.frameworks = "UIKit"
end
