Pod::Spec.new do |s|
  s.name             = 'SwiftDebouncer'
  s.version          = '0.1.1'
  s.summary          = 'Swift Debouncer Library to delay function calls'
 
  s.description      = <<-DESC
Swift Debouncer Library to delay function calls and not have them called multiple times at once
                       DESC
 
  s.homepage         = 'https://github.com/xremix/SwiftDebouncer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Toni Hoffmann' => 'toni-hoffmann@xremix.de' }
  s.source           = { :git => 'https://github.com/xremix/SwiftDebouncer.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'SwiftDebouncer/*.swift'
 
end
