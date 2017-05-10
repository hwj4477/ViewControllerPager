Pod::Spec.new do |s|

    s.name = 'ViewControllerPager'
    s.version = '1.0.2'
    s.summary = 'iOS ViewController Pager'

    s.description  = 'This library is similar to the Android ViewPager style.'

    s.license = 'MIT'

    s.homepage = 'https://github.com/hwj4477/ViewControllerPager'

    s.authors            = { "wjhong" => "hwj4477@gmail.com" }

    s.source = { :git => 'https://github.com/hwj4477/ViewControllerPager.git', :tag => s.version }

    s.ios.deployment_target = '8.1'

    s.source_files = 'ViewControllerPager/*.swift'
    
end

