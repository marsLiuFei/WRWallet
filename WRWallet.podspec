Pod::Spec.new do |s|

  s.name         = "WRWallet"
  s.version      = "0.0.1"
  s.ios.deployment_target = '9.0'
  s.summary      = "项目SDK."
  s.homepage     = "https://github.com/marsLiuFei/WRWallet"
  s.license              = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "mars_liu_dev" => "mars_liu_dev@163.com" }
  s.source       = { :git => "https://github.com/marsLiuFei/WRWallet", :tag => s.version }
  #s.source_files  = "WRWallet/*"
  
  s.dependency  'Masonry'
  s.dependency  'MJRefresh'
  s.dependency  'MJExtension'
  s.dependency  'MBProgressHUD'
  s.dependency  'AFNetworking'
  s.dependency  'IQKeyboardManager'
  s.dependency  'SDWebImage'
  s.dependency  'CRBoxInputView', '~> 1.2.1'
  
  s.vendored_frameworks = 'WRWallet.framework'
  s.requires_arc = true

end
