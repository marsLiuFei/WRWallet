Pod::Spec.new do |s|
  s.name         = "WRWallet"
  s.version      = "0.0.1"
  s.ios.deployment_target = '9.0'
  s.summary      = "项目SDK."
  s.homepage     = "https://github.com/marsLiuFei/WRWallet"
  s.social_media_url = 'https://www.baidu.com'
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "mars_liu_dev" => "mars_liu_dev@163.com" }
  s.source       = { :git => "https://github.com/marsLiuFei/WRWallet.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = 'WRWallet/*'
  s.dependency  'Masonry'
  s.dependency  'MJRefresh'
  s.dependency  'MJExtension'
  s.dependency  'MBProgressHUD'
  s.dependency  'AFNetworking'
  s.dependency  'IQKeyboardManager'
  s.dependency  'SDWebImage'
  s.dependency  'CRBoxInputView', '~> 1.2.1'

  s.requires_arc = true
end
