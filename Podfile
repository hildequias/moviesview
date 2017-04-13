source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!

def import_pods
    pod 'MBProgressHUD', '~> 1.0.0'
    pod 'SDWebImage', '~>3.8'
    pod 'AFNetworking', '~> 3.0'
    pod 'JSONModel', '~> 1.7.0'
end

def import_pods_tests
    pod 'Expecta', '~> 1.0'   # expecta matchers
    pod 'OCMock',  '~> 2.2'   # OCMock
end

target 'MovieView' do

    import_pods
end

target 'MovieViewTests' do

    import_pods_tests
end
