Pod::Spec.new do |s|
    s.name         = 'LBXPrompt'
    s.version      = '1.0'
    s.summary      = 'ios LBXPrompt'
    s.homepage     = 'https://github.com/MxABC/LBXPrompt'
    s.license      = 'MIT'
    s.authors      = {'lbxia' => 'lbxia20091227@foxmail.com'}
    s.source       = {:git => 'https://github.com/MxABC/LBXPrompt.git', :tag => s.version}
    s.requires_arc = true
    s.prefix_header_contents = '#import <Foundation/Foundation.h>'

    s.ios.deployment_target = '8.0'
    s.source_files = 'LBXPrompt/*.{h,m}'
    s.frameworks = 'Foundation', 'UIKit'
    s.resource = 'LBXPrompt/LBXProgressHUD.bundle'


end
