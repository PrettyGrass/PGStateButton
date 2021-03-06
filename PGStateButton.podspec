Pod::Spec.new do |spec|
  spec.name         = 'PGStateButton'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/PrettyGrass/'
  spec.authors      = { 'yl' => 'y0love@163.com' }
  spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
  spec.source       = { :git => 'git@github.com:PrettyGrass/PGStateButton.git', :tag => '1.0.0' }
  spec.ios.deployment_target  = '8.0'

  spec.public_header_files =    'PGStateButton/**/*.{h,hpp}'
  spec.source_files =           'PGStateButton/**/*.{h,m,c,mm,cpp}'
  spec.requires_arc = true
end
